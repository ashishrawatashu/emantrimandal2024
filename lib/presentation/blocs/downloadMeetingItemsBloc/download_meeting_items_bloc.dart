import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/usecase/local/add_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_item_details_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/delete_all_items_details_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/delete_all_items_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:meta/meta.dart';
import '../../../core/error/network_error.dart';
import '../../../core/utils/singleton.dart';
import '../../../domain/usecase/base/local_base_usecase.dart';
import '../../../domain/usecase/local/delete_all_departments_usecase.dart';
import '../../../domain/usecase/remote/get_meetings_items_usecase.dart';
part 'download_meeting_items_event.dart';
part 'download_meeting_items_state.dart';

class DownloadMeetingItemsBloc
    extends Bloc<DownloadMeetingItemsEvent, DownloadMeetingItemsState> {
  final GetMeetingsItemsUseCase _getMeetingsItemsUseCase;
  final AddDepartmentUseCase _addDepartmentUseCase;
  final AddItemsUseCase _addItemsUseCase;
  final AddItemsDetailsUseCase _addItemsDetailsUseCase;
  final DeleteAllDepartmentsUseCase _deleteAllDepartmentsUseCase;
  final DeleteAllItemsUseCase _deleteAllItemsUseCase;
  final DeleteAllItemsDetailsUseCase _deleteAllItemsDetailsUseCase;

  DownloadMeetingItemsBloc(
      this._getMeetingsItemsUseCase,
      this._addDepartmentUseCase,
      this._addItemsUseCase,
      this._addItemsDetailsUseCase, this._deleteAllDepartmentsUseCase, this._deleteAllItemsUseCase, this._deleteAllItemsDetailsUseCase)
      : super(DownloadMeetingItemsInitial()) {
    on<GetMeetingItemsEvent>(getMeetingItemsEvent);
    on<AddDepartmentsEvent>(addDepartmentsEvent);
    on<AddItemsEvent>(addItemsEvent);
    on<AddItemsDetailsEvent>(addItemsDetailsEvent);
    on<GetMeetingItemsBackgroundEvent>(getDataInBackground);
  }

  FutureOr<void> getMeetingItemsEvent(GetMeetingItemsEvent event, Emitter<DownloadMeetingItemsState> emit) async {
    emit(GetMeetingItemsLoading());

    try {

      // if (Platform.isAndroid) {
      //   MacAddress.getMacAddress();
      // } else if (Platform.isWindows) {
      //   MySingleton().MAC = await MacAddress.getMacAddressForWindows();
      // }
      GetMeetingItemsParams getMeetingItemsParams = GetMeetingItemsParams(MAC: MySingleton().MAC, token: MySingleton().TOKEN);
      final result = await _getMeetingsItemsUseCase.execute(params: getMeetingItemsParams);
      result.fold(
        (error) {
          MySingleton().ERROR_MSG = MySingleton().technicalError;
          emit(GetMeetingItemsError(error));
        },
        (data) async {
          if (isValidResponse(data)) {
            // Handle valid response
            switch (data.code) {
              case "100":
                // MySingleton().getMeetingsItemsModel = data;
                await addDepartments(data.departments);
                await addItems(data.items);
                await addItemsDetails(data.itemsDetails);
                emit(NavigateToDownloadScreenToMantriInfoState());

                break;
              case "101":
                MySingleton().ERROR_MSG = MySingleton().noMeetingMsg;
                emit(GetMeetingItemsHasNoData());
                break;
              case "102":
                MySingleton().ERROR_MSG = MySingleton().noMeetingMsg;
                emit(GetMeetingItemsHasNoData());
                break;
              default:
                MySingleton().ERROR_MSG = MySingleton().noMeetingMsg;
                emit(GetMeetingItemsHasNoData());
                break;
            }
          } else {
            MySingleton().ERROR_MSG =MySingleton().technicalError;
            emit(GetMeetingItemsHasNoData());
          }
        },
      );
    } catch (e) {
      MySingleton().ERROR_MSG =MySingleton().technicalError;
      emit(GetMeetingItemsHasNoData());
    }
  }

  bool isValidResponse(GetMeetingsItemsModel data) {
    return data.code != null &&
        (data.departments != null ||
            data.items != null ||
            data.itemsDetails != null);
  }

  FutureOr<void> getDataInBackground(GetMeetingItemsBackgroundEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    GetMeetingItemsParams getMeetingItemsParams = GetMeetingItemsParams(MAC: MySingleton().MAC, token: MySingleton().TOKEN);
    final result = await _getMeetingsItemsUseCase.execute(params: getMeetingItemsParams);
    result.fold(
      (error) {},
      (data) async {
        if (data.code == "100") {
          await addDepartments(data.departments);
          await addItems(data.items);
          await addItemsDetails(data.itemsDetails);
        } else if (data.code == "101") {}
      },
    );
  }

  FutureOr<void> addDepartmentsEvent(AddDepartmentsEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    emit(AddDepartmentsLoadingState());
    final result = await _addDepartmentUseCase.call(event.departmentsModel);
    result.fold(
          (error) {
        print("DEPT_ADDED_ERROR");
      },
          (data) async {
        print("DEPT_ADDED");
      },
    );
  }

  FutureOr<void> addItemsEvent(AddItemsEvent event, Emitter<DownloadMeetingItemsState> emit) async {
    emit(AddItemsLoadingState());
    final result = await _addItemsUseCase.call(event.itemsModel);
    result.fold(
          (error) {
        print("ITEM_ADDED_ERROR");
      },
          (data) async {
        print("ITEM_ADDED");
      },
    );
  }

  FutureOr<void> addItemsDetailsEvent(AddItemsDetailsEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    final result = await _addItemsDetailsUseCase.call(event.itemsDetailsModel);
    result.fold(
      (error) {
        print("ITEM_DETAILS_ADDED_ERROR");
      },
      (data) async {
        print("ITEM_DETAILS_ADDED");
      },
    );
  }


  Future<void> addDepartments(List<DepartmentsModel>? departments) async {
    final result = await _deleteAllDepartmentsUseCase.call(const DefaultParams());

    result.fold((error) {
      print("DEPT_DELETED_ERROR");
    },(data) {
      print("DEPT_DELETED");
      for (int i = 0; i < departments!.length; i++) {
        this.add(AddDepartmentsEvent(departments[i]));
      }
    },
    );

  }


  Future<void> addItems(List<ItemsModel>? itemsList) async {

    final result = await _deleteAllItemsUseCase.call(const DefaultParams());
    result.fold((error) {
      print("ITEMS_DELETED_ERROR");
    },(data) {
      print("ITEMS_DELETED");
      for (int i = 0; i < itemsList!.length; i++) {
        this.add(AddItemsEvent(itemsList[i]));
      }
    },
    );
  }

  Future<void> addItemsDetails(List<ItemsDetailsModel>? itemsDetailsList) async {
    final result = await _deleteAllItemsDetailsUseCase.call(const DefaultParams());
    result.fold((error) {
      print("ITEMS_DETAILS_DELETED_ERROR");
    },(data) {
      print("ITEMS_DETAILS_DELETED");
      for (int i = 0; i < itemsDetailsList!.length; i++) {
        this.add(AddItemsDetailsEvent(itemsDetailsList[i]));
      }
    },
    );
  }
}
