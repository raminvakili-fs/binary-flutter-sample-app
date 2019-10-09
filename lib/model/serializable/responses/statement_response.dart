library statement_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'statement_response.g.dart';

@JsonSerializable(explicitToJson: true)
class StatementResponse extends ResponseBase{

  @JsonKey(nullable: true, name: 'statement')
  Statement statement;

  StatementResponse(Error error, String msgType, int reqId, this.statement) : super(error: error, msgType: msgType, reqId: reqId);

  factory StatementResponse.fromJson(Map<String, dynamic> json) => _$StatementResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StatementResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Statement{

  @JsonKey(nullable: true, name: 'count')
  int count;
  @JsonKey(nullable: true, name: 'transactions')
  List<Transactions> transactions;

  Statement(this.count, this.transactions);

  factory Statement.fromJson(Map<String, dynamic> json) => _$StatementFromJson(json);
  Map<String, dynamic> toJson() => _$StatementToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Transactions {

  @JsonKey(nullable: true, name: 'action_type')
  String actionType;
  @JsonKey(nullable: true, name: 'amount')
  double amount;
  @JsonKey(nullable: true, name: 'app_id')
  int appId;
  @JsonKey(nullable: true, name: 'balance_after')
  double balanceAfter;
  @JsonKey(nullable: true, name: 'contract_id')
  int contractId;
  @JsonKey(nullable: true, name: 'longcode')
  String longcode;
  @JsonKey(nullable: true, name: 'payout')
  double payout;
  @JsonKey(nullable: true, name: 'reference_id')
  int referenceId;
  @JsonKey(nullable: true, name: 'shortcode')
  String shortcode;
  @JsonKey(nullable: true, name: 'transaction_id')
  int transactionId;
  @JsonKey(nullable: true, name: 'transaction_time')
  int transactionTime;

  Transactions(this.actionType, this.amount, this.appId, this.balanceAfter,
      this.contractId, this.longcode, this.payout, this.referenceId,
      this.shortcode, this.transactionId, this.transactionTime);

  factory Transactions.fromJson(Map<String, dynamic> json) => _$TransactionsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsToJson(this);

}