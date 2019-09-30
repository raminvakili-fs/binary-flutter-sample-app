// GENERATED CODE - DO NOT MODIFY BY HAND

part of price_proposal_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceProposalResponse _$PriceProposalResponseFromJson(
    Map<String, dynamic> json) {
  return PriceProposalResponse(
    error: json['error'] == null ? null : Error.fromJson(json['error']),
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    proposal: json['proposal'] == null
        ? null
        : Proposal.fromJson(json['proposal'] as Map<String, dynamic>),
    subscription: json['subscription'] == null
        ? null
        : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PriceProposalResponseToJson(
        PriceProposalResponse instance) =>
    <String, dynamic>{
      'error': instance.error?.toJson(),
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'proposal': instance.proposal?.toJson(),
      'subscription': instance.subscription?.toJson(),
    };

Proposal _$ProposalFromJson(Map<String, dynamic> json) {
  return Proposal(
    askPrice: (json['ask_price'] as num)?.toDouble(),
    multiplier: json['multiplier'] as int,
    dateStart: json['date_start'] as int,
    displayValue: json['display_value'] as String,
    id: json['id'] as String,
    longcode: json['longcode'] as String,
    payout: json['payout'] as int,
    spot: (json['spot'] as num)?.toDouble(),
    spotTime: json['spot_time'] as int,
  );
}

Map<String, dynamic> _$ProposalToJson(Proposal instance) => <String, dynamic>{
      'ask_price': instance.askPrice,
      'multiplier': instance.multiplier,
      'date_start': instance.dateStart,
      'display_value': instance.displayValue,
      'id': instance.id,
      'longcode': instance.longcode,
      'payout': instance.payout,
      'spot': instance.spot,
      'spot_time': instance.spotTime,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return Subscription(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
