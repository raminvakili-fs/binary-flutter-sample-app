import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:binary_mobile_app/model/authentication/oauth.dart';

class AppViewModel extends ChangeNotifier {

  final _userInfo = BehaviorSubject<User>();

  BehaviorSubject<User> get userInfo => _userInfo;
  
  authenticateWithOauth() async{
    User user = await OAuthentication.instance.getToken();
    print('User info: ${user.accounts[0].token}');
    _userInfo.add(user);
  }

  @override
  void dispose() {
    super.dispose();
    _userInfo.close();
  }

}