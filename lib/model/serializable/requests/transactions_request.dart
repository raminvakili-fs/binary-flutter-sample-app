library transactions_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'transactions_request.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionsRequest extends RequestBase{

  @JsonKey(name: 'transaction', nullable: false)
  int transaction;
  @JsonKey(name: 'subscribe', nullable: true, includeIfNull: false)
  int subscribe;

  TransactionsRequest({int reqID, this.transaction = 1, this.subscribe}) : super(reqId: reqID);

  factory TransactionsRequest.fromJson(Map<String, dynamic> json) => _$TransactionsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsRequestToJson(this);

}