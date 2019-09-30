library active_symbols_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'active_symbols_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ActiveSymbolsRequest extends RequestBase{

  @JsonKey(name: 'active_symbols')
  String activeSymbols;
  @JsonKey(name: 'product_type')
  String productType;
  @JsonKey(name: 'landing_company', nullable: true, includeIfNull: false)
  String landingCompany;

  ActiveSymbolsRequest({int reqId, this.activeSymbols, this.landingCompany, this.productType}) : super(reqId);

  factory ActiveSymbolsRequest.fromJson(Map<String, dynamic> json) => _$ActiveSymbolsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveSymbolsRequestToJson(this);

}
