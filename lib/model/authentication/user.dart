class User {

  List<Account> _accounts;

  User() : _accounts = List<Account>();

  addAccount(Account account) => _accounts.add(account);

}

class Account {
  final String id;
  final String token;
  final String currency;

  Account(this.id, this.token, this.currency);


}