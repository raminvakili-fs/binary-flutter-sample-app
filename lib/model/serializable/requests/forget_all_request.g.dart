// GENERATED CODE - DO NOT MODIFY BY HAND

part of forget_all_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetAllRequest _$ForgetAllRequestFromJson(Map<String, dynamic> json) {
  return ForgetAllRequest(
    forgetAll: (json['forget_all'] as List)?.map((e) => e as String)?.toList(),
  )..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ForgetAllRequestToJson(ForgetAllRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'forget_all': instance.forgetAll,
    };
