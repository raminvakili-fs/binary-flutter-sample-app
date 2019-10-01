import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'request_base.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestBase {

  @JsonKey(name: 'req_id', nullable: true, includeIfNull: false)
  int reqId;

  RequestBase(this.reqId);


  factory RequestBase.fromJson(Map<String, dynamic> json) => _$RequestBaseFromJson(json);

  Map<String, dynamic> toJson() => _$RequestBaseToJson(this);

}

