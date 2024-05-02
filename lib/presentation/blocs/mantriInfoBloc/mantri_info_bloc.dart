import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mantri_info_event.dart';
part 'mantri_info_state.dart';

class MantriInfoBloc extends Bloc<MantriInfoEvent, MantriInfoState> {
  MantriInfoBloc() : super(MantriInfoInitial()) {
    on<MantriInfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
