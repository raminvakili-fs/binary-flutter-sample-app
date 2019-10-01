// GENERATED CODE - DO NOT MODIFY BY HAND

part of statement_request;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatementRequest _$StatementRequestFromJson(Map<String, dynamic> json) {
  return StatementRequest(
    reqId: json['req_id'] as int,
    dateFrom: json['date_from'] as int,
    dateTo: json['date_to'] as int,
    statement: json['statement'] as int,
    description: json['description'] as int,
    limit: json['limit'] as int,
    offset: json['offset'] as int,
  );
}

Map<String, dynamic> _$StatementRequestToJson(StatementRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('req_id', instance.reqId);
  writeNotNull('date_from', instance.dateFrom);
  writeNotNull('date_to', instance.dateTo);
  val['statement'] = instance.statement;
  writeNotNull('description', instance.description);
  writeNotNull('limit', instance.limit);
  writeNotNull('offset', instance.offset);
  return val;
}
