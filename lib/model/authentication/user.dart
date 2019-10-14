import 'package:flutter/cupertino.dart';

class OAuthResponse {

  List<TokenInfo> _accounts;
  List<TokenInfo> get accounts => _accounts;

  OAuthResponse() : _accounts = List<TokenInfo>();

  addAccount(TokenInfo account) => _accounts.add(account);

}

class TokenInfo {
  final String id;
  final String token;
  final String currency;

  TokenInfo({@required this.id, @required this.token, @required this.currency});


}