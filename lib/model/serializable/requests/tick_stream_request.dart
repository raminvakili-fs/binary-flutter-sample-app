
import 'dart:convert';

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'tick_stream_request.g.dart';


@JsonSerializable(explicitToJson: true)
class TickStreamRequest extends RequestBase{

  @JsonKey(name: 'req_id')
  final int reqId;

  @JsonKey(name: 'ticks')
  final String ticks;

  @JsonKey(name: 'subscribe')
  final int subscribe;

  TickStreamRequest(this.reqId, this.ticks, this.subscribe) : super(reqId: reqId);

  factory TickStreamRequest.fromJson(Map<String, dynamic> json) => _$TickStreamRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TickStreamRequestToJson(this);

}