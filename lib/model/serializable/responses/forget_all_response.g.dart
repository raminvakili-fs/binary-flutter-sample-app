// GENERATED CODE - DO NOT MODIFY BY HAND

part of forget_all_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetAllResponse _$ForgetAllResponseFromJson(Map<String, dynamic> json) {
  return ForgetAllResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    (json['forget_all'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$ForgetAllResponseToJson(ForgetAllResponse instance) {
  final val = <String, dynamic>{
    'error': instance.error?.toJson(),
    'msg_type': instance.msgType,
    'req_id': instance.reqId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('forget_all', instance.forgetAll);
  return val;
}
