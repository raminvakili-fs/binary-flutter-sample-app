library buy_contract_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_contract_request.g.dart';

@JsonSerializable(explicitToJson: true)
class BuyContractRequest extends RequestBase {

  @JsonKey(name: 'buy')
  String buy;
  @JsonKey(name: 'price', includeIfNull: false)
  double price;
  @JsonKey(name: 'subscribe', nullable: true, includeIfNull: false)
  int subscribe;


  BuyContractRequest({int reqID, this.buy, this.price, this.subscribe}) : super(reqId: reqID);

  factory BuyContractRequest.fromJson(Map<String, dynamic> json) => _$BuyContractRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BuyContractRequestToJson(this);

}
