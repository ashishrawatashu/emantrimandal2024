import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:emantrimandal/core/error/failure.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_details_model.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_item_details_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/add_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_departments_usecase.dart';
import 'package:emantrimandal/presentation/blocs/mantriDashboardBloc/mantri_dashboard_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_meeting_items_params.dart';
import 'package:meta/meta.dart';
import '../../../core/error/network_error.dart';
import '../../../core/utils/get_mac_address.dart';
import '../../../core/utils/singleton.dart';
import '../../../domain/usecase/remote/get_meetings_items_usecase.dart';

part 'download_meeting_items_event.dart';

part 'download_meeting_items_state.dart';

class DownloadMeetingItemsBloc
    extends Bloc<DownloadMeetingItemsEvent, DownloadMeetingItemsState> {
  final GetMeetingsItemsUseCase _getMeetingsItemsUseCase;
  final AddDepartmentUseCase _addDepartmentUseCase;
  final AddItemsUseCase _addItemsUseCase;
  final AddItemsDetailsUseCase _addItemsDetailsUseCase;

  DownloadMeetingItemsBloc(
      this._getMeetingsItemsUseCase,
      this._addDepartmentUseCase,
      this._addItemsUseCase,
      this._addItemsDetailsUseCase)
      : super(DownloadMeetingItemsInitial()) {
    on<GetMeetingItemsEvent>(getMeetingItemsEvent);
    on<AddDepartmentsEvent>(addDepartmentsEvent);
    on<AddItemsEvent>(addItemsEvent);
    on<AddItemsDetailsEvent>(addItemsDetailsEvent);

    // on<GetDepartmentsEvent>(getDepartmentsEvent);
  }

  FutureOr<void> getMeetingItemsEvent(GetMeetingItemsEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    emit(GetMeetingItemsLoading());
    // if (Platform.isAndroid) {
    //   MacAddress.getMacAddress();
    // }else if (Platform.isWindows) {
    //   MySingleton().MAC = await MacAddress.getMacAddressForWindows();
    // }



    GetMeetingItemsParams getMeetingItemsParams = GetMeetingItemsParams(MAC: MySingleton().MAC, token: MySingleton().TOKEN);
    final result = await _getMeetingsItemsUseCase.execute(params: getMeetingItemsParams);
    result.fold(
      (error) {
        emit(GetMeetingItemsError(error));
      },
      (data) async {
        if (data.code == "100") {
          emit(NavigateToDownloadScreenToMantriInfoState());
          MySingleton().getMeetingsItemsModel = data;
          // emit(GetMeetingItemsHasData(data));
          //adding departments
          await addDepartments(data.departments);
          await addItems(data.items);
          await addItemsDetails(data.itemsDetails);

        } else if (data.code == "101") {
          emit(GetMeetingItemsHasNoData(data));
        }else if (data.code == "102") {
          MySingleton().ERROR_MSG = "खेद है, आज  कोई  बैठक  प्रस्तावित नहीं हैं |";
          emit(NavigateToDownloadScreenToMantriInfoState());
          // emit(GetMeetingItemsHasNoData(data));
        }
      },
    );
  }

  FutureOr<void> addDepartmentsEvent(AddDepartmentsEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    emit(AddDepartmentsLoadingState());
    final result = await _addDepartmentUseCase.call(event.departmentsModel);
    result.fold(
      (error) {
        print("errorAddDepartmentsEvent");
      },
      (data) async {
        print("addDepartmentsEvent");

        // emit(AddDepartmentsSuccessState());
        // this.add(GetDepartmentsEvent());
      },
    );
  }

  // FutureOr<void> getDepartmentsEvent(GetDepartmentsEvent event, Emitter<DownloadMeetingItemsState> emit) async {
  //   final result = await _getDepartmentUseCase.call(const DefaultParams());
  //   result.fold(
  //         (error) {
  //       print(error);
  //     },
  //         (data) {
  //           print(data.length.toString()+"DEPARTMENTS");
  //     },
  //   );
  // }

  Future<void> addDepartments(List<DepartmentsModel>? departments) async {
    for (int i = 0; i < departments!.length; i++) {
      this.add(AddDepartmentsEvent(departments[i]));
    }
  }

  FutureOr<void> addItemsEvent(
      AddItemsEvent event, Emitter<DownloadMeetingItemsState> emit) async {
    emit(AddItemsLoadingState());
    final result = await _addItemsUseCase.call(event.itemsModel);
    result.fold(
      (error) {
        print("errorAddItemsEvent");
      },
      (data) async {
        print(data);
        print("addItemsEvent");
        // emit(AddItemsSuccessState());
      },
    );
  }

  FutureOr<void> addItemsDetailsEvent(AddItemsDetailsEvent event,
      Emitter<DownloadMeetingItemsState> emit) async {
    // emit(AddItemsDetailsLoadingState());
    final result = await _addItemsDetailsUseCase.call(event.itemsDetailsModel);
    result.fold(
      (error) {
        print("errorAddItemsDetailsEvent");
      },
      (data) async {
        print("addItemsDetailsEvent");
        // emit(NavigateToDownloadScreenToMantriInfoState());
      },
    );
  }

  Future<void> addItems(List<ItemsModel>? itemsList) async {
    for (int i = 0; i < itemsList!.length; i++) {
      this.add(AddItemsEvent(itemsList[i]));
    }
  }

  Future<void> addItemsDetails(
      List<ItemsDetailsModel>? itemsDetailsList) async {
    for (int i = 0; i < itemsDetailsList!.length; i++) {
      this.add(AddItemsDetailsEvent(itemsDetailsList[i]));
    }
  }
}
