import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:emantrimandal/data/model/getMeetingsItemsModel/departments_model.dart';
import 'package:emantrimandal/domain/usecase/base/local_base_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_departments_usecase.dart';
import 'package:meta/meta.dart';
part 'mantri_dashboard_event.dart';
part 'mantri_dashboard_state.dart';


class MantriDashboardBloc extends Bloc<MantriDashboardEvent, MantriDashboardState> {

  final GetDepartmentUseCase _departmentUseCase;

  MantriDashboardBloc(this._departmentUseCase) : super(MantriDashboardInitial()) {
    on<GetDepartmentsEvent>(getDepartmentsEvent);
  }


  FutureOr<void> getDepartmentsEvent(GetDepartmentsEvent event, Emitter<MantriDashboardState> emit) async {
    final result = await _departmentUseCase.call(const DefaultParams());
    result.fold((error) {
      emit(DepartmentLoadingErrorState());
    },(data) {
      emit(GetDepartmentsSuccessState(data));
    },
    );
  }

}
