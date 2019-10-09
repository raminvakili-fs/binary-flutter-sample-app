// GENERATED CODE - DO NOT MODIFY BY HAND

part of contracts_for_symbol_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractsForSymbolRequest _$ContractsForSymbolRequestFromJson(
    Map<String, dynamic> json) {
  return ContractsForSymbolRequest(
    reqId: json['req_id'] as int,
    contractsFor: json['contracts_for'] as String,
    currency: json['currency'] as String,
    productType: json['product_type'] as String,
    landingCompany: json['landing_company'] as String,
  );
}

Map<String, dynamic> _$ContractsForSymbolRequestToJson(
    ContractsForSymbolRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['contracts_for'] = instance.contractsFor;
  writeNotNull('currency', instance.currency);
  writeNotNull('product_type', instance.productType);
  writeNotNull('landing_company', instance.landingCompany);
  return val;
}
