import 'package:emantrimandal/domain/entity/remote/get_item_for_minister/get_items_for_ministers.dart';

/// code : "100"
/// Items : [{"meetingcode":"4/2/I/XXI/2024/  C X","ministerCode":null,"agendatypeid":1,"meetingPlace":"सचिवालय मुख्यमंत्री","meetingDateTime":"2024-01-29T08:30:00Z","itemComputerNo":1,"agendaTypeName":"Main Agenda","deptname":"dept1 ","subjectName":"R & P Rules","subject":"छपाई और अक्षर योजन उद्योग का एक साधारण डमी पाठ है. Lorem Ipsum","fileNumber":"Test29012024","ministername":null,"displayOrderNo":1,"startTime":null,"meetingStartTime":null,"itemCount":null}]
/// msg : "Success"

class GetItemForMinisterEntity {
  GetItemForMinisterEntity({
    String? code,
    List<GetItemsForMinisters>? items,
    String? msg,}){
    _code = code;
    _items = items;
    _msg = msg;
  }

  GetItemForMinisterEntity.fromJson(dynamic json) {
    _code = json['code'];
    if (json['Items'] != null) {
      _items = [];
      json['Items'].forEach((v) {
        _items?.add(GetItemsForMinisters.fromJson(v));
      });
    }
    _msg = json['msg'];
  }
  String? _code;
  List<GetItemsForMinisters>? _items;
  String? _msg;
  GetItemForMinisterEntity copyWith({  String? code,
    List<GetItemsForMinisters>? items,
    String? msg,
  }) => GetItemForMinisterEntity(  code: code ?? _code,
    items: items ?? _items,
    msg: msg ?? _msg,
  );
  String? get code => _code;
  List<GetItemsForMinisters>? get items => _items;
  String? get msg => _msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_items != null) {
      map['Items'] = _items?.map((v) => v.toJson()).toList();
    }
    map['msg'] = _msg;
    return map;
  }


  GetItemForMinisterEntity toModel() =>GetItemForMinisterEntity(code:code,items:items,msg:msg);




}