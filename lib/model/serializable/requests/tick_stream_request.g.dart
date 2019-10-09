// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tick_stream_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickStreamRequest _$TickStreamRequestFromJson(Map<String, dynamic> json) {
  return TickStreamRequest(
    json['req_id'] as int,
    json['ticks'] as String,
    json['subscribe'] as int,
  );
}

Map<String, dynamic> _$TickStreamRequestToJson(TickStreamRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'ticks': instance.ticks,
      'subscribe': instance.subscribe,
    };
