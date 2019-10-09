library contracts_for_symbol_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'contracts_for_symbol_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractsForSymbolRequest extends RequestBase{

  @JsonKey(name: 'contracts_for')
  String contractsFor;
  @JsonKey(name: 'currency', nullable: true, includeIfNull: false)
  String currency;
  @JsonKey(name: 'product_type', nullable: true, includeIfNull: false)
  String productType;
  @JsonKey(name: 'landing_company', nullable: true, includeIfNull: false)
  String landingCompany;

  ContractsForSymbolRequest({int reqId, this.contractsFor, this.currency, this.productType, this.landingCompany}) : super(reqId: reqId);

  factory ContractsForSymbolRequest.fromJson(Map<String, dynamic> json) => _$ContractsForSymbolRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ContractsForSymbolRequestToJson(this);

}