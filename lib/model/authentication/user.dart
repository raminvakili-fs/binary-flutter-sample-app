import 'package:flutter/cupertino.dart';

class User {

  List<Account> _accounts;
  List<Account> get accounts => _accounts;

  User() : _accounts = List<Account>();

  addAccount(Account account) => _accounts.add(account);

}

class Account {
  final String id;
  final String token;
  final String currency;

  Account({@required this.id, @required this.token, @required this.currency});


}