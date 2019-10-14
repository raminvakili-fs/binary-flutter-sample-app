library authorize_response;

import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:json_annotation/json_annotation.dart';


part 'authorize_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthorizeResponse extends ResponseBase{

  @JsonKey(nullable: true, includeIfNull: false, name: 'authorize')
  Authorize authorize;

  AuthorizeResponse(Error error, String msgType, int reqId, this.authorize) : super(error: error, msgType: msgType, reqId: reqId);

  factory AuthorizeResponse.fromJson(Map<String, dynamic> json) => _$AuthorizeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizeResponseToJson(this);

}

@JsonSerializable(explicitToJson: true)
class Authorize{

  @JsonKey(nullable: true, includeIfNull: false, name: 'account_list')
  List<AccountList> accountList;
  @JsonKey(nullable: true, includeIfNull: false, name: 'balance')
  double balance;
  @JsonKey(nullable: true, includeIfNull: false, name: 'country')
  String country;
  @JsonKey(nullable: true, includeIfNull: false, name: 'currency')
  String currency;
  @JsonKey(nullable: true, includeIfNull: false, name: 'email')
  String email;
  @JsonKey(nullable: true, includeIfNull: false, name: 'fullname')
  String fullname;
  @JsonKey(nullable: true, includeIfNull: false, name: 'is_virtual')
  int isVirtual;
  @JsonKey(nullable: true, includeIfNull: false, name: 'landing_company_fullname')
  String landingCompanyFullname;
  @JsonKey(nullable: true, includeIfNull: false, name: 'landing_company_name')
  String landingCompanyName;
  @JsonKey(nullable: true, includeIfNull: false, name: 'loginid')
  String loginid;
  @JsonKey(nullable: true, includeIfNull: false, name: 'scopes')
  List<String> scopes;
  @JsonKey(nullable: true, includeIfNull: false, name: 'upgradeable_landing_companies')
  List<String> upgradeableLandingCompanies;
  @JsonKey(nullable: true, includeIfNull: false, name: 'user_id')
  int userId;

  Authorize(this.accountList, this.balance, this.country, this.currency,
      this.email, this.fullname, this.isVirtual, this.landingCompanyFullname,
      this.landingCompanyName, this.loginid, this.scopes,
      this.upgradeableLandingCompanies, this.userId);

  factory Authorize.fromJson(Map<String, dynamic> json) => _$AuthorizeFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorizeToJson(this);

}


@JsonSerializable(explicitToJson: true)
class AccountList{

  @JsonKey(nullable: true, includeIfNull: false, name: 'currency')
  String currency;
  @JsonKey(nullable: true, includeIfNull: false, name: 'is_disabled')
  int isDisabled;
  @JsonKey(nullable: true, includeIfNull: false, name: 'is_virtual')
  int isVirtual;
  @JsonKey(nullable: true, includeIfNull: false, name: 'landing_company_name')
  String landingCompanyName;
  @JsonKey(nullable: true, includeIfNull: false, name: 'loginid')
  String loginid;

  AccountList(this.currency, this.isDisabled, this.isVirtual,
      this.landingCompanyName, this.loginid);

  factory AccountList.fromJson(Map<String, dynamic> json) => _$AccountListFromJson(json);
  Map<String, dynamic> toJson() => _$AccountListToJson(this);

}

