// GENERATED CODE - DO NOT MODIFY BY HAND

part of active_symbols_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveSymbolsRequest _$ActiveSymbolsRequestFromJson(Map<String, dynamic> json) {
  return ActiveSymbolsRequest(
    reqId: json['req_id'] as int,
    activeSymbols: json['active_symbols'] as String,
    landingCompany: json['landing_company'] as String,
    productType: json['product_type'] as String,
  );
}

Map<String, dynamic> _$ActiveSymbolsRequestToJson(
    ActiveSymbolsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['active_symbols'] = instance.activeSymbols;
  val['product_type'] = instance.productType;
  writeNotNull('landing_company', instance.landingCompany);
  return val;
}
