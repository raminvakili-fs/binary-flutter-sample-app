import 'dart:async';
import 'dart:convert';

import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:web_socket_channel/io.dart';

class BinaryApi2 {
  IOWebSocketChannel _channel;
  static BinaryApi2 _instance;

  int reqID = 1;

  //Is for keeping track of the requests that has been sent to map the their response once it received from the server
  //Needs optimization in case of removing requests that are not stream base. and need only one time call.
  List<ResponseStream> _responseStreams = List<ResponseStream>();

  static BinaryApi2 get getInstance {
    if (_instance == null) {
      _instance = BinaryApi2._();
    }
    return _instance;
  }

  BinaryApi2._() {
    _channel = IOWebSocketChannel.connect(
        'wss://ws.binaryws.com/websockets/v3?app_id=$APP_ID');
    _channel.stream.listen(_onStreamData);
  }

  //Send the request that are received from the different parts of the app and returns a stream to the
  //caller for the upcoming responses
  Stream<ResponseBase> sendRequest(RequestBase requestBase, {bool getResponseStream = true}) {
    Stream returnedStream;
    if (getResponseStream) {
      StreamController<ResponseBase> streamController;
      var streamReqID = _containsReqId(_responseStreams, requestBase.reqId);

      if (streamReqID == null) {
        streamController = StreamController.broadcast();
        var responseStream = ResponseStream(
            streamController, requestBase.reqId);
        _responseStreams.add(responseStream);
      } else {
        streamController = streamReqID.streamController;
      }
      returnedStream = streamController.stream;
    }

    print("json: ${jsonEncode(requestBase.toJson())}");
    _channel.sink.add(jsonEncode(requestBase.toJson()));

    return returnedStream;
  }

  //this callback method is responsible for mapping the response to the proper request source, (it uses req_id to do so)
  _onStreamData(dynamic responseString) {
    ResponseBase responseBase =
        ResponseBase.fromJson(jsonDecode(responseString));

    print("${responseBase.toJson()}");

    for (ResponseStream rs in _responseStreams) {
      if (rs.reqID == responseBase.reqId) {
        Map jsonMap = jsonDecode(responseString);
        switch (responseBase.msgType) {
          case 'tick':
            responseBase = TickStreamResponse.fromJson(jsonMap);
            break;

          case 'active_symbols':
            responseBase = ActiveSymbolsResponse.fromJson(jsonMap);
            break;

          case 'contracts_for':
            responseBase = ContractsForSymbolResponse.fromJson(jsonMap);
            break;

          case 'proposal':
            responseBase = PriceProposalResponse.fromJson(jsonMap);
            break;

          case 'buy':
            responseBase = BuyContractResponse.fromJson(jsonMap);
            break;
        }
        rs.streamController.add(responseBase);
      }
    }
  }


  ResponseStream _containsReqId(List<ResponseStream> responseStreams, int reqID) {
    for (var rs in responseStreams){
      if (rs.reqID == reqID){
        return rs;
      }
    }
    return null;
  }

}

class ResponseStream {
  final StreamController<ResponseBase> streamController;
  final int reqID;

  ResponseStream(this.streamController, this.reqID);
}
