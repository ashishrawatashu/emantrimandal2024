/// meetingcode : "4/2/I/XXI/2024/  C X"
/// ministerCode : null
/// agendatypeid : 1
/// meetingPlace : "सचिवालय मुख्यमंत्री"
/// meetingDateTime : "2024-01-29T08:30:00Z"
/// itemComputerNo : 1
/// agendaTypeName : "Main Agenda"
/// deptname : "dept1 "
/// subjectName : "R & P Rules"
/// subject : "छपाई और अक्षर योजन उद्योग का एक साधारण डमी पाठ है. Lorem Ipsum"
/// fileNumber : "Test29012024"
/// ministername : null
/// displayOrderNo : 1
/// startTime : null
/// meetingStartTime : null
/// itemCount : null

class GetItemsForMinisters {
  GetItemsForMinisters({
    String? meetingcode,
    dynamic ministerCode,
    num? agendatypeid,
    String? meetingPlace,
    String? meetingDateTime,
    num? itemComputerNo,
    String? agendaTypeName,
    String? deptname,
    String? subjectName,
    String? subject,
    String? fileNumber,
    dynamic ministername,
    num? displayOrderNo,
    dynamic startTime,
    dynamic meetingStartTime,
    dynamic itemCount,
  }) {
    _meetingcode = meetingcode;
    _ministerCode = ministerCode;
    _agendatypeid = agendatypeid;
    _meetingPlace = meetingPlace;
    _meetingDateTime = meetingDateTime;
    _itemComputerNo = itemComputerNo;
    _agendaTypeName = agendaTypeName;
    _deptname = deptname;
    _subjectName = subjectName;
    _subject = subject;
    _fileNumber = fileNumber;
    _ministername = ministername;
    _displayOrderNo = displayOrderNo;
    _startTime = startTime;
    _meetingStartTime = meetingStartTime;
    _itemCount = itemCount;
  }

  GetItemsForMinisters.fromJson(dynamic json) {
    _meetingcode = json['meetingcode'];
    _ministerCode = json['ministerCode'];
    _agendatypeid = json['agendatypeid'];
    _meetingPlace = json['meetingPlace'];
    _meetingDateTime = json['meetingDateTime'];
    _itemComputerNo = json['itemComputerNo'];
    _agendaTypeName = json['agendaTypeName'];
    _deptname = json['deptname'];
    _subjectName = json['subjectName'];
    _subject = json['subject'];
    _fileNumber = json['fileNumber'];
    _ministername = json['ministername'];
    _displayOrderNo = json['displayOrderNo'];
    _startTime = json['startTime'];
    _meetingStartTime = json['meetingStartTime'];
    _itemCount = json['itemCount'];
  }

  String? _meetingcode;
  dynamic _ministerCode;
  num? _agendatypeid;
  String? _meetingPlace;
  String? _meetingDateTime;
  num? _itemComputerNo;
  String? _agendaTypeName;
  String? _deptname;
  String? _subjectName;
  String? _subject;
  String? _fileNumber;
  dynamic _ministername;
  num? _displayOrderNo;
  dynamic _startTime;
  dynamic _meetingStartTime;
  dynamic _itemCount;

  GetItemsForMinisters copyWith({
    String? meetingcode,
    dynamic ministerCode,
    num? agendatypeid,
    String? meetingPlace,
    String? meetingDateTime,
    num? itemComputerNo,
    String? agendaTypeName,
    String? deptname,
    String? subjectName,
    String? subject,
    String? fileNumber,
    dynamic ministername,
    num? displayOrderNo,
    dynamic startTime,
    dynamic meetingStartTime,
    dynamic itemCount,
  }) =>
      GetItemsForMinisters(
        meetingcode: meetingcode ?? _meetingcode,
        ministerCode: ministerCode ?? _ministerCode,
        agendatypeid: agendatypeid ?? _agendatypeid,
        meetingPlace: meetingPlace ?? _meetingPlace,
        meetingDateTime: meetingDateTime ?? _meetingDateTime,
        itemComputerNo: itemComputerNo ?? _itemComputerNo,
        agendaTypeName: agendaTypeName ?? _agendaTypeName,
        deptname: deptname ?? _deptname,
        subjectName: subjectName ?? _subjectName,
        subject: subject ?? _subject,
        fileNumber: fileNumber ?? _fileNumber,
        ministername: ministername ?? _ministername,
        displayOrderNo: displayOrderNo ?? _displayOrderNo,
        startTime: startTime ?? _startTime,
        meetingStartTime: meetingStartTime ?? _meetingStartTime,
        itemCount: itemCount ?? _itemCount,
      );

  String? get meetingcode => _meetingcode;

  dynamic get ministerCode => _ministerCode;

  num? get agendatypeid => _agendatypeid;

  String? get meetingPlace => _meetingPlace;

  String? get meetingDateTime => _meetingDateTime;

  num? get itemComputerNo => _itemComputerNo;

  String? get agendaTypeName => _agendaTypeName;

  String? get deptname => _deptname;

  String? get subjectName => _subjectName;

  String? get subject => _subject;

  String? get fileNumber => _fileNumber;

  dynamic get ministername => _ministername;

  num? get displayOrderNo => _displayOrderNo;

  dynamic get startTime => _startTime;

  dynamic get meetingStartTime => _meetingStartTime;

  dynamic get itemCount => _itemCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['meetingcode'] = _meetingcode;
    map['ministerCode'] = _ministerCode;
    map['agendatypeid'] = _agendatypeid;
    map['meetingPlace'] = _meetingPlace;
    map['meetingDateTime'] = _meetingDateTime;
    map['itemComputerNo'] = _itemComputerNo;
    map['agendaTypeName'] = _agendaTypeName;
    map['deptname'] = _deptname;
    map['subjectName'] = _subjectName;
    map['subject'] = _subject;
    map['fileNumber'] = _fileNumber;
    map['ministername'] = _ministername;
    map['displayOrderNo'] = _displayOrderNo;
    map['startTime'] = _startTime;
    map['meetingStartTime'] = _meetingStartTime;
    map['itemCount'] = _itemCount;
    return map;
  }

  GetItemsForMinisters toModel() => GetItemsForMinisters(
      meetingcode: meetingcode,
      ministerCode: ministerCode,
      agendatypeid: agendatypeid,
      meetingPlace: meetingPlace,
      meetingDateTime: meetingDateTime,
      itemComputerNo: itemComputerNo,
      agendaTypeName: agendaTypeName,
      deptname: deptname,
      subjectName: subjectName,
      subject: subject,
      fileNumber: fileNumber,
      ministername: ministername,
      displayOrderNo: displayOrderNo,
      startTime: startTime,
      meetingStartTime: meetingStartTime,
      itemCount: itemCount);
}
