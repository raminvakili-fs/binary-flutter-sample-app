// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tick_stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickStreamResponse _$TickStreamResponseFromJson(Map<String, dynamic> json) {
  return TickStreamResponse(
    json['subscription'] == null
        ? null
        : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
    json['tick'] == null
        ? null
        : Tick.fromJson(json['tick'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TickStreamResponseToJson(TickStreamResponse instance) =>
    <String, dynamic>{
      'subscription': instance.subscription?.toJson(),
      'tick': instance.tick?.toJson(),
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    json['id'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

Tick _$TickFromJson(Map<String, dynamic> json) {
  return Tick(
    (json['ask'] as num)?.toDouble(),
    (json['bid'] as num)?.toDouble(),
    json['epoch'] as int,
    json['id'] as String,
    json['pip_size'] as int,
    (json['quote'] as num)?.toDouble(),
    json['symbol'] as String,
  );
}

Map<String, dynamic> _$TickToJson(Tick instance) => <String, dynamic>{
      'ask': instance.ask,
      'bid': instance.bid,
      'epoch': instance.epoch,
      'id': instance.id,
      'pip_size': instance.pipSize,
      'quote': instance.quote,
      'symbol': instance.symbol,
    };
