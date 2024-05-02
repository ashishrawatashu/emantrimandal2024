import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'department_item_list_event.dart';
part 'department_item_list_state.dart';

class DepartmentItemListBloc extends Bloc<DepartmentItemListEvent, DepartmentItemListState> {
  DepartmentItemListBloc() : super(DepartmentItemListInitial()) {
    on<DepartmentItemListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
