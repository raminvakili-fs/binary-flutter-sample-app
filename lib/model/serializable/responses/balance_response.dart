library balance_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'balance_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BalanceResponse extends ResponseBase {

  @JsonKey(name: 'balance', nullable: true)
  Balance  balance;
  @JsonKey(name: 'subscription', nullable: true)
  Subscription subscription;

  BalanceResponse(Error error, String msgType, int reqId, this.balance, this.subscription) : super(error: error, msgType: msgType, reqId: reqId);

  factory BalanceResponse.fromJson(Map<String, dynamic> json) => _$BalanceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Balance{

  @JsonKey(name: 'balance', nullable: true)
  double balance;
  @JsonKey(name: 'currency', nullable: true)
  String currency;
  @JsonKey(name: 'id', nullable: true)
  String id;
  @JsonKey(name: 'loginid', nullable: true)
  String loginid;

  Balance(this.balance, this.currency, this.id, this.loginid);

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Subscription{
  @JsonKey(name: 'id', nullable: true)
  String id;

  Subscription(this.id);

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);


}
