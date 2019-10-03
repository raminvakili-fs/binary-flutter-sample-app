import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:flutter/cupertino.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  BinaryApi2 binaryApi2 = BinaryApi2.getInstance;

  setLoading (bool loading) {
    _isLoading = loading;
  }


}