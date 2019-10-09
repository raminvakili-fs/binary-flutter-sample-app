//import 'dart:convert';
//
//import 'package:binary_mobile_app/app_constants.dart';
//import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
//import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
//import 'package:flutter/gestures.dart';
//import 'package:web_socket_channel/io.dart';
//
//class BinaryApi{
//
//  IOWebSocketChannel _channel;
//  static BinaryApi _instance;
//
//  List<ApiRequestCallback> _requests = List<ApiRequestCallback>();
//
//
//  static BinaryApi get getInstance {
//    if (_instance == null){
//      _instance  = BinaryApi._();
//    }
//    return _instance;
//  }
//
//  BinaryApi._(){
//    _channel = IOWebSocketChannel.connect('wss://ws.binaryws.com/websockets/v3?app_id=$APP_ID');
//    _channel.stream.listen(_onStreamData);
//  }
//
//  sendRequest(Request request, Function(ResponseBase) callback){
//    _channel.sink.add(request.toJson());
//    _requests.add(ApiRequestCallback(request.reqId, callback));
//  }
//
//  _onStreamData(dynamic responseString){
//
//    ResponseBase responseBase = ResponseBase.fromJson(jsonDecode(responseString));
//
//    print('response base ${responseBase.reqId}');
//
//    if (responseBase.error == null){
//      for (var reqCallback in _requests){
//        if (responseBase.reqId == reqCallback.reqID){
//
//          switch (responseBase.msgType){
//            case 'active_symbols':
//              ActiveSymbolsResponse activeSymbolsResponse = ActiveSymbolsResponse.fromJson(jsonDecode(responseString));
//              print('activeSymbolsResponse ${activeSymbolsResponse.reqId}');
//              reqCallback.callBack(activeSymbolsResponse);
//              break;
//
//            case 'authorize':
//              reqCallback.callBack(responseBase);
//              break;
//
//            case 'tick':
//              break;
//          }
//
//        }
//      }
//    }
//
//  }
//
//
//}
//
//
//class ApiRequestCallback {
//  final int reqID;
//  final Function(ResponseBase) callBack;
//
//  ApiRequestCallback(this.reqID, this.callBack);
//}