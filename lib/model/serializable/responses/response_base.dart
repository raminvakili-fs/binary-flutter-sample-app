import 'package:json_annotation/json_annotation.dart';

part 'response_base.g.dart';


@JsonSerializable(explicitToJson: true)
class ResponseBase {

  @JsonKey(nullable: true)
  final Error error;
  @JsonKey(name: 'msg_type')
  final String msgType;
  @JsonKey(name: 'req_id')
  final int reqId;


  ResponseBase({this.error, this.msgType, this.reqId});

  factory ResponseBase.fromJson(Map<String, dynamic> json) => _$ResponseBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseBaseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Error{

  final String code;
  final String message;

  Error({this.code, this.message});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);

}
