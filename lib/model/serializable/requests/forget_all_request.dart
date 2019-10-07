library forget_all_request;

import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'forget_all_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ForgetAllRequest extends RequestBase{

  @JsonKey(name: 'forget_all')
  List<String> forgetAll;

  ForgetAllRequest({int reqID, this.forgetAll}) : super(reqId: reqID);

  factory ForgetAllRequest.fromJson(Map<String, dynamic> json) => _$ForgetAllRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetAllRequestToJson(this);

}
