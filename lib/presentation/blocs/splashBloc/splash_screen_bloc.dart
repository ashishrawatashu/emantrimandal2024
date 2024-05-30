import 'dart:async';
import 'package:emantrimandal/core/utils/singleton.dart';
import 'package:emantrimandal/data/model/generateToken/generate_token_model.dart';
import 'package:emantrimandal/data/model/getDetailsModel/meetings_details_model.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/generate_token_params.dart';
import 'package:bloc/bloc.dart';
import 'package:emantrimandal/domain/usecase/local/add_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/get_departments_usecase.dart';
import 'package:emantrimandal/domain/usecase/local/save_meeting_details_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:emantrimandal/domain/entity/remote/request_params/get_details_params.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import '../../../core/error/failure.dart';
import '../../../core/error/network_error.dart';
import '../../../data/model/getDetailsModel/get_details_model.dart';
import '../../../domain/usecase/base/local_base_usecase.dart';
import '../../../domain/usecase/remote/get_details_usecase.dart';
import '../../../domain/usecase/remote/get_token_usecase.dart';
import '../../../domain/usecase/local/get_meeting_details_use_case.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final GenerateTokenUseCase _generateTokenUseCase;
  final GetDetailsUseCase _getDetailsUseCase;
  final SaveMeetingDetailsUseCase _saveMeetingDetailsUseCase;
  final GetMeetingDetailsUseCase _getMeetingDetailsUseCase;

  SplashScreenBloc(this._generateTokenUseCase, this._getDetailsUseCase,
      this._saveMeetingDetailsUseCase, this._getMeetingDetailsUseCase)
      : super(SplashScreenInitial()) {
    on<GenerateTokenDataEvent>(generateTokenDataEvent);
    on<GetDetailsFetchEvent>(getDetailsFetchEvent);
    on<SaveMeetingDetailsEvent>(saveMeetingDetailsEvent);
    on<GetMeetingDetailsEvent>(getMeetingDetailsEvent);
  }

  FutureOr<void> generateTokenDataEvent(GenerateTokenDataEvent event, Emitter<SplashScreenState> emit) async {
    emit(GenerateTokenLoading());
    // final _getMacAddressPlugin = GetMacAddress();
    // String macAddress;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      // macAddress = await _getMacAddressPlugin.getMacAddress() ?? 'Unknown mac address';
      // MySingleton().MAC = macAddress;
      GenerateTokenParams generateTokenParams = GenerateTokenParams(
          MACUID: MySingleton().MAC,
          MACKey: MySingleton().MACKEY,
          Lat: "0.0",
          Longt: "0.0");
      final result = await _generateTokenUseCase.execute(params: generateTokenParams);
      result.fold(
        (error) {
          emit(GenerateTokenError(error));
        },
        (data) {
          if (data.code == "100") {
            MySingleton().TOKEN = data.tokenDetails![0].token.toString();
            this.add(GetDetailsFetchEvent());
            emit(GenerateTokenHasData(data));
            emit(NavigateSplashToDownloadScreenState());
          } else if (data.code == "101") {
            emit(GenerateTokenHasNoData(data));
            emit(NavigateSplashToErrorScreenState());
          }
        },
      );
    } on PlatformException {
      // macAddress = 'Failed to get mac address.';
    }
  }

  FutureOr<void> getDetailsFetchEvent(
      GetDetailsFetchEvent event, Emitter<SplashScreenState> emit) async {
    emit(GetDetailsLoading());
    GetDetailsParams getDetailsParams = GetDetailsParams(
        MAC: MySingleton().MAC,
        Token: MySingleton().TOKEN,
        MACKey: MySingleton().MACKEY,
        Lat: "0.0",
        Longt: "0.0");
    final result = await _getDetailsUseCase.execute(params: getDetailsParams);
    result.fold(
      (error) {
        emit(GetDetailsError(error));
      },
      (data) {
        if (data.code == "100") {
          emit(GetDetailsHasData(data));
          MySingleton().getDetailsModel = data;
          this.add(SaveMeetingDetailsEvent(data.meetingDetail![0]));
          emit(NavigateSplashToDownloadScreenState());
        } else if (data.code == "101") {
          emit(GetDetailsHasNoData(data));
          emit(NavigateSplashToErrorScreenState());
        }
      },
    );
  }

  FutureOr<void> saveMeetingDetailsEvent(
      SaveMeetingDetailsEvent event, Emitter<SplashScreenState> emit) async {
    emit(SaveMeetingDetailsLoadingState());
    final result =
        await _saveMeetingDetailsUseCase.call(event.meetingDetailModel);
    result.fold(
      (error) {
        print(error);
        emit(SaveMeetingDetailsErrorState(error));
      },
      (data) {
        print(data);
        emit(SaveMeetingDetailsSuccessState());
        this.add(GetMeetingDetailsEvent());
      },
    );
  }

  FutureOr<void> getMeetingDetailsEvent(
      GetMeetingDetailsEvent event, Emitter<SplashScreenState> emit) async {
    emit(GetMeetingDetailsLoadingState());
    final result = await _getMeetingDetailsUseCase.call(const DefaultParams());
    result.fold(
      (error) {
        print(error);
        emit(GetMeetingDetailsErrorState(error));
      },
      (data) {
        emit(GetMeetingDetailsSuccessState(data));
      },
    );
  }
}
