import 'dart:convert';

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'tick_stream_response.g.dart';

@JsonSerializable(explicitToJson: true)
 class TickStreamResponse
    extends ResponseBase{


  @JsonKey(name: 'subscription')
  final Subscription subscription;
  @JsonKey(name: 'tick')
  final Tick tick;

  TickStreamResponse(this.subscription, this.tick);

  factory TickStreamResponse.fromJson(Map<String, dynamic> json) => _$TickStreamResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TickStreamResponseToJson(this);

}

@JsonSerializable()
class Subscription {

  @JsonKey(name: 'id')
  final String id;

  Subscription(this.id);

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}


@JsonSerializable()
class Tick {

  @JsonKey(name: 'ask')
  final double ask;
  @JsonKey(name: 'bid')
  final double bid;
  @JsonKey(name: 'epoch')
  final int epoch;
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'pip_size')
  final int pipSize;
  @JsonKey(name: 'quote')
  final double quote;
  @JsonKey(name: 'symbol')
  final String symbol;

  Tick(this.ask, this.bid, this.epoch, this.id, this.pipSize, this.quote, this.symbol);

  factory Tick.fromJson(Map<String, dynamic> json) => _$TickFromJson(json);
  Map<String, dynamic> toJson() => _$TickToJson(this);

}
