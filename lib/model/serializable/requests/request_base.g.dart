// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestBase _$RequestBaseFromJson(Map<String, dynamic> json) {
  return RequestBase(
    json['req_id'] as int,
  );
}

Map<String, dynamic> _$RequestBaseToJson(RequestBase instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  return val;
}
