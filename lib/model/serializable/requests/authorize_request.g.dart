// GENERATED CODE - DO NOT MODIFY BY HAND

part of authorize_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeRequest _$AuthorizeRequestFromJson(Map<String, dynamic> json) {
  return AuthorizeRequest(
    json['req_id'] as int,
    json['authorize'] as String,
    json['add_to_login_history'] as int,
  );
}

Map<String, dynamic> _$AuthorizeRequestToJson(AuthorizeRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'authorize': instance.authorize,
      'add_to_login_history': instance.addToLoginHistory,
    };
