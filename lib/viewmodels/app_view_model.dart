import 'package:binary_mobile_app/model/authentication/user.dart';
import 'package:binary_mobile_app/model/serializable/requests/authorize_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/authorize_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:binary_mobile_app/model/authentication/oauth.dart';
import 'package:rxdart/rxdart.dart';

class AppViewModel extends BaseViewModel {

  final _authorizeResponse = BehaviorSubject<AuthorizeResponse>();
  BehaviorSubject<AuthorizeResponse> get authorizeResponse => _authorizeResponse;


  authenticateWithOauth() async{
    OAuthResponse oAuthResponse = await OAuthentication.instance.getToken();
    if (oAuthResponse != null && oAuthResponse.accounts.length > 0) {
      print('User info: ${oAuthResponse.accounts[0].token}');
      binaryApi2.sendRequest(AuthorizeRequest(this.hashCode + 1, authorize: oAuthResponse.accounts[1].token), getResponseStream: true)
          .listen((authorizeResponse) {

            _authorizeResponse.add(authorizeResponse);

      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _authorizeResponse.close();
  }

}