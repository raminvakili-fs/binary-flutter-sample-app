import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc extends ChangeNotifier {

  BinaryApi2 binaryApi2 = BinaryApi2.getInstance;

  BehaviorSubject<bool> isLoading = BehaviorSubject()..add(false);

  @override
  void dispose() {
    super.dispose();
    isLoading.close();
  }

}