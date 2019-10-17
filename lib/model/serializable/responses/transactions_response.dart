library transactions_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'transactions_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionsResponse extends ResponseBase{

  @JsonKey(name: 'subscription', nullable: true, includeIfNull: false)
  Subscription subscription;
  @JsonKey(name: 'transaction', nullable: true, includeIfNull: false)
  Transaction transaction;

  TransactionsResponse(Error error, String msgType, int reqId, this.subscription, this.transaction) : super(error: error, msgType: msgType, reqId: reqId);

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) => _$TransactionsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionsResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Subscription{

  @JsonKey(name: 'id', nullable: true, includeIfNull: false)
  String id;

  Subscription(this.id);

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
  Map<String, dynamic> toJson() => _$SubscriptionToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Transaction{
  @JsonKey(name: 'id', nullable: true, includeIfNull: false)
  String id;

  @JsonKey(name: 'amount', nullable: true, includeIfNull: false)
  double amount;

  @JsonKey(name: 'balance', nullable: true, includeIfNull: false)
  double balance;

  @JsonKey(name: 'high_barrier', nullable: true, includeIfNull: false)
  double highBarrier;

  @JsonKey(name: 'low_barrier', nullable: true, includeIfNull: false)
  double lowBarrier;

  @JsonKey(name: 'barrier', nullable: true, includeIfNull: false)
  double barrier;

  @JsonKey(name: 'longcode', nullable: true, includeIfNull: false)
  String longCode;

  @JsonKey(name: 'purchase_time', nullable: true, includeIfNull: false)
  int purchaseTime;

  @JsonKey(name: 'symbol', nullable: true, includeIfNull: false)
  String symbol;

  @JsonKey(name: 'contract_id', nullable: true, includeIfNull: false)
  int contractId;

  @JsonKey(name: 'transaction_id', nullable: true, includeIfNull: false)
  int transactionId;

  @JsonKey(name: 'display_name', nullable: true, includeIfNull: false)
  String displayName;

  @JsonKey(name: 'currency', nullable: true, includeIfNull: false)
  String currency;

  @JsonKey(name: 'date_expiry', nullable: true, includeIfNull: false)
  int dateExpiry;

  @JsonKey(name: 'action', nullable: true, includeIfNull: false)
  String action;

  @JsonKey(name: 'transaction_time', nullable: true, includeIfNull: false)
  int transactionTime;


  Transaction(this.id, this.amount, this.balance, this.highBarrier,
      this.lowBarrier, this.barrier, this.longCode, this.purchaseTime,
      this.symbol, this.contractId, this.transactionId, this.displayName,
      this.currency, this.dateExpiry, this.action, this.transactionTime);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);

}