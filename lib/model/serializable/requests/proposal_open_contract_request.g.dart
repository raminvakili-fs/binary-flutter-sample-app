// GENERATED CODE - DO NOT MODIFY BY HAND

part of proposal_open_contract_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalOpenContractRequest _$ProposalOpenContractRequestFromJson(
    Map<String, dynamic> json) {
  return ProposalOpenContractRequest(
    proposalOpenContract: json['proposal_open_contract'] as int,
    contractId: json['contract_id'] as int,
    subscribe: json['subscribe'] as int,
  )..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ProposalOpenContractRequestToJson(
    ProposalOpenContractRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  val['proposal_open_contract'] = instance.proposalOpenContract;
  val['contract_id'] = instance.contractId;
  writeNotNull('subscribe', instance.subscribe);
  return val;
}
