library statement_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'statement_request.g.dart';

@JsonSerializable(explicitToJson: true)
class StatementRequest extends RequestBase {

  @JsonKey(nullable: true, name: 'date_from', includeIfNull: false)
  int dateFrom;
  @JsonKey(nullable: true, name: 'date_to', includeIfNull: false)
  int dateTo;
  @JsonKey(nullable: true, name: 'statement')
  int statement;
  @JsonKey(nullable: true, name: 'description', includeIfNull: false)
  int description;
  @JsonKey(nullable: true, name: 'limit', includeIfNull: false)
  int limit;
  @JsonKey(nullable: true, name: 'offset', includeIfNull: false)
  int offset;

  StatementRequest({int reqId, this.dateFrom, this.dateTo, this.statement = 1, this.description, this.limit, this.offset}) : super(reqId);

  factory StatementRequest.fromJson(Map<String, dynamic> json) => _$StatementRequestFromJson(json);
  Map<String, dynamic> toJson() => _$StatementRequestToJson(this);

}