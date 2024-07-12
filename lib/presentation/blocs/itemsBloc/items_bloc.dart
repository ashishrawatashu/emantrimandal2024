import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/items_model.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_all_items_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_items_by_dept_id_usecase.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/singleton.dart';

part 'items_event.dart';
part 'items_state.dart';

class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {

  final GetAllItemsUseCase _getAllItemsUseCase;
  final GetItemsByDeptIdUseCase _getItemsByDeptIdUseCase;
  ItemsBloc(this._getAllItemsUseCase, this._getItemsByDeptIdUseCase) : super(ItemsInitial()) {
    on<GetItemsEvent>(getItemsEvent);
    on<GetItemsByDeptIdEvent>(getItemsByDeptIdEvent);
  }


  FutureOr<void> getItemsEvent(GetItemsEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoadingState());
    final result = await _getAllItemsUseCase.call(const DefaultParams());
    result.fold((error) {
      print(error);
    },(data) {
      emit(GetItemsSuccessState(data,data.length));
    },
    );
  }




  FutureOr<void> getItemsByDeptIdEvent(GetItemsByDeptIdEvent event, Emitter<ItemsState> emit) async {
    emit(ItemsLoadingState());
    final result = await _getItemsByDeptIdUseCase.call(event.deptId);
    result.fold((error) {
      print(error);
    }, (data) {
      emit(GetItemsSuccessState(data,0));
      print(data.length.toString() + "ITEMS BY ID");
    },
    );
  }

}
