library balance_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'balance_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BalanceRequest extends RequestBase{

  @JsonKey(name: 'account', nullable: true, includeIfNull: false)
  String account;
  @JsonKey(name: 'subscribe', nullable: true, includeIfNull: false)
  int subscribe;
  @JsonKey(name: 'balance')
  int balance;

  BalanceRequest({int reqId, this.account, this.subscribe, this.balance}) : super(reqId);

  factory BalanceRequest.fromJson(Map<String, dynamic> json) => _$BalanceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceRequestToJson(this);

}
