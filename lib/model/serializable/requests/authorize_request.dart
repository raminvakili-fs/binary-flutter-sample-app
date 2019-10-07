library authorize_request;

import 'package:json_annotation/json_annotation.dart';

import 'request_base.dart';

part 'authorize_request.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorizeRequest extends RequestBase {

  @JsonKey(name: 'authorize')
  final String authorize;
  @JsonKey(name: 'add_to_login_history', includeIfNull: false)
  final int addToLoginHistory;

  AuthorizeRequest(int reqId, {this.authorize, this.addToLoginHistory}) : super(reqId:reqId);

  factory AuthorizeRequest.fromJson(Map<String, dynamic> json) => _$AuthorizeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizeRequestToJson(this);

}