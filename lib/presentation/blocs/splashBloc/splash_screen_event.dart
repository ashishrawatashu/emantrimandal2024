part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent {}

class SplashScreenFetchEvent extends SplashScreenEvent {

}

//generateToken
class GenerateTokenDataEvent extends SplashScreenEvent {

}

//getDetails

class GetDetailsFetchEvent extends SplashScreenEvent {

}

//saveDetails
class SaveMeetingDetailsEvent extends SplashScreenEvent {
  final MeetingDetailModel meetingDetailModel;
  SaveMeetingDetailsEvent(this.meetingDetailModel);
}


class GetMeetingDetailsEvent extends SplashScreenEvent {

}





