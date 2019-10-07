library asset_index_request;

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'request_base.dart';

part 'asset_index_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AssetIndexRequest extends RequestBase{
  @JsonKey(name: 'asset_index')
  final int assetIndex;
  @JsonKey(name: 'landing_company')
  final String landingCompany;

  AssetIndexRequest(int reqId, this.assetIndex, this.landingCompany) : super(reqId: reqId);

  factory AssetIndexRequest.fromJson(Map<String, dynamic> json) => _$AssetIndexRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AssetIndexRequestToJson(this);

}