library forget_all_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_all_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ForgetAllResponse extends ResponseBase {


  @JsonKey(name: 'forget_all', nullable: true, includeIfNull: false)
  List<String> forgetAll;

  ForgetAllResponse(Error error, String msgType, int reqId, this.forgetAll) : super(error: error, msgType: msgType, reqId: reqId);

  factory ForgetAllResponse.fromJson(Map<String, dynamic> json) => _$ForgetAllResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetAllResponseToJson(this);


}