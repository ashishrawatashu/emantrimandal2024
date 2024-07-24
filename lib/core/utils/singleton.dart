import '../../data/model/getDetailsModel/get_details_model.dart';
import '../../data/model/getMeetingsItemsModel/departments_model.dart';
import '../../data/model/getMeetingsItemsModel/get_meetings_items_model.dart';
import '../../data/model/getMeetingsItemsModel/items_model.dart';

class MySingleton{

  static final MySingleton  _singleton = MySingleton._internal();

  factory MySingleton(){
    return _singleton;
  }

  MySingleton._internal();

  String TOKEN = "";
  String MAC = "00:1A:3B:3C:4D:5E";
  // String MAC = "00:1A:3B:3C:4E:5E";
  // String MAC = "01:00:00:00:00:00";
  // String MAC = "00:1A:3B:3C:4B:5A";
  String MACKEY = "Cdaytest@123";

  // ख़ॆद है | तकनीकी ञुटि आ जाने के कारण कार्य पूरा नही हो पाया,\nकृपया मंत्रिपरिषद विभाग से संपर्क करे |
  String technicalError = "ख़ॆद है | तकनीकी ञुटि आ जाने के कारण कार्य पूरा नही हो पाया,\nकृपया मंत्रिपरिषद विभाग से संपर्क करे |";
  // खेद है, आज  कोई  बैठक  प्रस्तावित नहीं हैं |
  String noMeetingMsg = "खेद है, आज कोई बैठक प्रस्तावित नहीं हैं |";
  //यह टैब इस प्रणाली मे पंजीकृत नहीं है,\nकृपया मंत्रिपरिषद विभाग से संपर्क करे |
  String invalidTab = "यह टैब इस प्रणाली मे पंजीकृत नहीं है,\nकृपया मंत्रिपरिषद विभाग से संपर्क करे |";

  String ERROR_MSG = "";

  //mantri Info
  GetDetailsModel getDetailsModel = GetDetailsModel();


}


