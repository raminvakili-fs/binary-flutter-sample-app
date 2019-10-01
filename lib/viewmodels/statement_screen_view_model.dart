import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:binary_mobile_app/model/serializable/requests/statement_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/statement_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class StatementScreenViewModel extends ChangeNotifier{

  BinaryApi2 _binaryApi2;

  StatementScreenViewModel(){
    _binaryApi2 = BinaryApi2.getInstance;

    _binaryApi2.sendRequest(StatementRequest(reqId: this.hashCode, limit: 25)).listen((response){
      statementResponse.add(response);
    });
  }


  BehaviorSubject<StatementResponse> _statementResponse = BehaviorSubject<StatementResponse>();
  BehaviorSubject<StatementResponse> get statementResponse => _statementResponse;


  void dispose(){
    _statementResponse.close();
  }

}