// GENERATED CODE - DO NOT MODIFY BY HAND

part of authorize_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeRequest _$AuthorizeRequestFromJson(Map<String, dynamic> json) {
  return AuthorizeRequest(
    json['req_id'] as int,
    authorize: json['authorize'] as String,
    addToLoginHistory: json['add_to_login_history'] as int,
  );
}

Map<String, dynamic> _$AuthorizeRequestToJson(AuthorizeRequest instance) {
  final val = <String, dynamic>{
    'req_id': instance.reqId,
    'authorize': instance.authorize,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('add_to_login_history', instance.addToLoginHistory);
  return val;
}
