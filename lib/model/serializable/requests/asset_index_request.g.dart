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

Map<String, dynamic> _$AssetIndexRequestToJson(AssetIndexRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'asset_index': instance.assetIndex,
      'landing_company': instance.landingCompany,
    };
