// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBase _$ResponseBaseFromJson(Map<String, dynamic> json) {
  return ResponseBase(
    json['error'] == null
        ? null
        : Error.fromJson(json['error'] as Map<String, dynamic>),
    json['msg_type'] as String,
    json['req_id'] as int,
  );
}

Map<String, dynamic> _$ResponseBaseToJson(ResponseBase instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
