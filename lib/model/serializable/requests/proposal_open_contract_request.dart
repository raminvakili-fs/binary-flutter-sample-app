library proposal_open_contract_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';


part 'proposal_open_contract_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ProposalOpenContractRequest extends RequestBase{

  @JsonKey(name: 'proposal_open_contract')
  int proposalOpenContract;
  @JsonKey(name: 'contract_id')
  int contractId;
  @JsonKey(name: 'subscribe', nullable: true, includeIfNull: false)
  int subscribe;

  ProposalOpenContractRequest({int reqID, this.proposalOpenContract = 1, @required this.contractId, this.subscribe}) : super(reqId: reqID);

  factory ProposalOpenContractRequest.fromJson(Map<String, dynamic> json) => _$ProposalOpenContractRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalOpenContractRequestToJson(this);

}