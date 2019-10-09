// GENERATED CODE - DO NOT MODIFY BY HAND

part of asset_index_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetIndexRequest _$AssetIndexRequestFromJson(Map<String, dynamic> json) {
  return AssetIndexRequest(
    json['req_id'] as int,
    json['asset_index'] as int,
    json['landing_company'] as String,
  );
}

Map<String, dynamic> _$AssetIndexRequestToJson(AssetIndexRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['asset_index'] = instance.assetIndex;
  val['landing_company'] = instance.landingCompany;
  return val;
}
