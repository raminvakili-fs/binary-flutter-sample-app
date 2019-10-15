import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:binary_mobile_app/model/db/database_helper.dart';
import 'package:binary_mobile_app/model/serializable/requests/authorize_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/authorize_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:binary_mobile_app/model/authentication/oauth.dart';
import 'package:rxdart/rxdart.dart';

class AppViewModel extends BaseViewModel {

  final _authorizeResponse = BehaviorSubject<AuthorizeResponse>();
  BehaviorSubject<AuthorizeResponse> get authorizeResponse => _authorizeResponse;

  final _databaseHelper = DatabaseHelper();


  authenticateWithOauth() async{
    OAuthResponse oAuthResponse = await OAuthentication.instance.getToken();

    await _databaseHelper.clearTable();
    for (var acc in oAuthResponse.accounts){
      _databaseHelper.insertAccount(acc);
    }

    if (oAuthResponse != null && oAuthResponse.accounts.length > 0) {
      _authenticate(oAuthResponse.accounts[0]);
      print('User info: ${oAuthResponse.accounts[0].token}');

    }
  }
  
  switchAccount(TokenInfo tokenInfo){
    _authenticate(tokenInfo);
  }

  _authenticate(TokenInfo tokenInfo){
    binaryApi2.sendRequest(AuthorizeRequest(this.hashCode + 1, authorize: tokenInfo.token), getResponseStream: true)
        .listen((authorizeResponse) {
      _authorizeResponse.add(authorizeResponse);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _authorizeResponse.close();
  }

}