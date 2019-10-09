library buy_contract_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/response_base.dart' as prefix0;
import 'package:json_annotation/json_annotation.dart';

part 'buy_contract_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BuyContractResponse extends ResponseBase{

  @JsonKey(includeIfNull: false, name: 'buy')
  Buy buy;
  @JsonKey(includeIfNull: false, name: 'subscription')
  Subscription subscription;


  BuyContractResponse(Error error, String msgType, int reqId, this.buy, this.subscription) : super(error: error, msgType: msgType, reqId: reqId);

  factory BuyContractResponse.fromJson(Map<String, dynamic> json) => _$BuyContractResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BuyContractResponseToJson(this);

}

@JsonSerializable()
class Buy {

  @JsonKey(includeIfNull: false, name: 'balance_after')
  double balanceAfter;
  @JsonKey(includeIfNull: false, name: 'buy_price')
  double buyPrice;
  @JsonKey(includeIfNull: false, name: 'contract_id')
  int contractId;
  @JsonKey(includeIfNull: false, name: 'longcode')
  String longcode;
  @JsonKey(includeIfNull: false, name: 'payout')
  double payout;
  @JsonKey(includeIfNull: false, name: 'purchase_time')
  int purchaseTime;
  @JsonKey(includeIfNull: false, name: 'shortcode')
  String shortcode;
  @JsonKey(includeIfNull: false, name: 'start_time')
  int startTime;
  @JsonKey(includeIfNull: false, name: 'transaction_id')
  int transactionId;

  Buy(this.balanceAfter, this.buyPrice, this.contractId, this.longcode,
      this.payout, this.purchaseTime, this.shortcode, this.startTime,
      this.transactionId);

  factory Buy.fromJson(Map<String, dynamic> json) => _$BuyFromJson(json);
  Map<String, dynamic> toJson() => _$BuyToJson(this);


}

@JsonSerializable()
class Subscription {
  @JsonKey(includeIfNull: false, name: 'id')
  String  id;

  Subscription(this.id);


  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

}
