import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:binary_mobile_app/model/serializable/requests/authorize_request.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:binary_mobile_app/model/authentication/oauth.dart';

class AppViewModel extends BaseViewModel {

  final _userInfo = BehaviorSubject<User>();

  BehaviorSubject<User> get userInfo => _userInfo;
  
  authenticateWithOauth() async{
    User user = await OAuthentication.instance.getToken();
    if (user != null && user.accounts.length > 0) {
      print('User info: ${user.accounts[0].token}');
      _userInfo.add(user);
      binaryApi2.sendRequest(AuthorizeRequest(1, authorize: user.accounts[1].token));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userInfo.close();
  }

}