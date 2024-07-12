part of 'splash_screen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object?> get props => [];
}

class SplashScreenInitial extends SplashScreenState {}



//navigate to download Screen


class NavigateSplashToDownloadScreenState extends SplashScreenState {

}

//navigate to error Screen

class NavigateSplashToErrorScreenState extends SplashScreenState {

}

//generateToken

class GenerateTokenLoading extends SplashScreenState {}



class GenerateTokenEmpty extends SplashScreenState {}


class GenerateTokenError extends SplashScreenState {
  final NetworkError error;

  GenerateTokenError(this.error);

  @override
  List<Object?> get props => [error];
}

class GenerateTokenHasData extends SplashScreenState {
  final GenerateTokenModel result;

  GenerateTokenHasData(this.result);

  @override
  List<Object?> get props => [result];
}


class GenerateTokenHasNoData extends SplashScreenState {

  GenerateTokenHasNoData();

  @override
  List<Object?> get props => [];
}

//GetDetails

class GetDetailsLoading extends SplashScreenState {}

class GetDetailsEmpty extends SplashScreenState {}


class GetDetailsError extends SplashScreenState {
  final NetworkError error;

  GetDetailsError(this.error);

  @override
  List<Object?> get props => [error];
}

class GetDetailsHasData extends SplashScreenState {
  final GetDetailsModel result;

  GetDetailsHasData(this.result);

  @override
  List<Object?> get props => [result];
}


class GetDetailsHasNoData extends SplashScreenState {
  final GetDetailsModel result;

  GetDetailsHasNoData(this.result);

  @override
  List<Object?> get props => [result];
}

//save meeting

class SaveMeetingDetailsLoadingState extends SplashScreenState {}

class SaveMeetingDetailsSuccessState extends SplashScreenState {}

class SaveMeetingDetailsErrorState extends SplashScreenState {
  final Failure error;
  SaveMeetingDetailsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}


//get meeting

class GetMeetingDetailsLoadingState extends SplashScreenState {}

class GetMeetingDetailsSuccessState extends SplashScreenState {
  final List<MeetingDetailModel> meetingDetailModel;
  GetMeetingDetailsSuccessState(this.meetingDetailModel);
}

class GetMeetingDetailsErrorState extends SplashScreenState {
  final Failure error;
  GetMeetingDetailsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}





