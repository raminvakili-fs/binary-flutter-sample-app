// GENERATED CODE - DO NOT MODIFY BY HAND

part of authorize_response;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeResponse _$AuthorizeResponseFromJson(Map<String, dynamic> json) {
  return AuthorizeResponse(
    json['error'] == null ? null : Error.fromJson(json['error']),
    json['msg_type'] as String,
    json['req_id'] as int,
    json['authorize'] == null
        ? null
        : Authorize.fromJson(json['authorize'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorizeResponseToJson(AuthorizeResponse instance) {
  final val = <String, dynamic>{
    'error': instance.error?.toJson(),
    'msg_type': instance.msgType,
    'req_id': instance.reqId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authorize', instance.authorize?.toJson());
  return val;
}

Authorize _$AuthorizeFromJson(Map<String, dynamic> json) {
  return Authorize(
    (json['account_list'] as List)
        ?.map((e) =>
            e == null ? null : AccountList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['balance'] as num)?.toDouble(),
    json['country'] as String,
    json['currency'] as String,
    json['email'] as String,
    json['fullname'] as String,
    json['is_virtual'] as int,
    json['landing_company_fullname'] as String,
    json['landing_company_name'] as String,
    json['loginid'] as String,
    (json['scopes'] as List)?.map((e) => e as String)?.toList(),
    (json['upgradeable_landing_companies'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    json['user_id'] as int,
  );
}

Map<String, dynamic> _$AuthorizeToJson(Authorize instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'account_list', instance.accountList?.map((e) => e?.toJson())?.toList());
  writeNotNull('balance', instance.balance);
  writeNotNull('country', instance.country);
  writeNotNull('currency', instance.currency);
  writeNotNull('email', instance.email);
  writeNotNull('fullname', instance.fullname);
  writeNotNull('is_virtual', instance.isVirtual);
  writeNotNull('landing_company_fullname', instance.landingCompanyFullname);
  writeNotNull('landing_company_name', instance.landingCompanyName);
  writeNotNull('loginid', instance.loginid);
  writeNotNull('scopes', instance.scopes);
  writeNotNull(
      'upgradeable_landing_companies', instance.upgradeableLandingCompanies);
  writeNotNull('user_id', instance.userId);
  return val;
}

AccountList _$AccountListFromJson(Map<String, dynamic> json) {
  return AccountList(
    json['currency'] as String,
    json['is_disabled'] as int,
    json['is_virtual'] as int,
    json['landing_company_name'] as String,
    json['loginid'] as String,
  );
}

Map<String, dynamic> _$AccountListToJson(AccountList instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('currency', instance.currency);
  writeNotNull('is_disabled', instance.isDisabled);
  writeNotNull('is_virtual', instance.isVirtual);
  writeNotNull('landing_company_name', instance.landingCompanyName);
  writeNotNull('loginid', instance.loginid);
  return val;
}
