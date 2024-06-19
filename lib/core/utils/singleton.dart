import '../../data/model/getDetailsModel/get_details_model.dart';
import '../../data/model/getMeetingsItemsModel/get_meetings_items_model.dart';

class MySingleton{

  static final MySingleton  _singleton = MySingleton._internal();

  factory MySingleton(){
    return _singleton;
  }

  MySingleton._internal();

  String TOKEN = "";
  String MAC = "00:1A:3B:3C:4D:5E";
  String MACKEY = "Cdaytest@123";
  String ERROR_MSG = "";


  GetDetailsModel getDetailsModel = GetDetailsModel();


  GetMeetingsItemsModel getMeetingsItemsModel = GetMeetingsItemsModel();


}


