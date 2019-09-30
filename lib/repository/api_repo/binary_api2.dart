import 'dart:async';
import 'dart:convert';

import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/serializable/requests/request_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:web_socket_channel/io.dart';

class BinaryApi2 {
  IOWebSocketChannel _channel;
  static BinaryApi2 _instance;

  int reqID = 1;

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

  Stream<ResponseBase> sendRequest(RequestBase requestBase) {
    StreamController<ResponseBase> streamController;
    var streamReqID = _containsReqId(_responseStreams, requestBase.reqId);

    if (streamReqID == null){
      streamController = StreamController.broadcast();
      var responseStream = ResponseStream(streamController, requestBase.reqId);
      _responseStreams.add(responseStream);
    } else {
      streamController = streamReqID.streamController;
    }

    print("json: ${jsonEncode(requestBase.toJson())}");
    _channel.sink.add(jsonEncode(requestBase.toJson()));

    return streamController.stream;
  }

  _onStreamData(dynamic responseString) {
    ResponseBase responseBase =
        ResponseBase.fromJson(jsonDecode(responseString));

    print("${responseBase.toJson()}");

    for (ResponseStream rs in _responseStreams) {
      if (rs.reqID == responseBase.reqId) {
        switch (responseBase.msgType) {
          case 'tick':
            TickStreamResponse tickStreamResponse =
                TickStreamResponse.fromJson(jsonDecode(responseString));
            rs.streamController.add(tickStreamResponse);
            break;

          case 'active_symbols':
            ActiveSymbolsResponse activeSymbolsResponse = ActiveSymbolsResponse.fromJson(jsonDecode(responseString));
            rs.streamController.add(activeSymbolsResponse);
            break;

          case 'contracts_for':
            ContractsForSymbolResponse contractsForSymbolResponse = ContractsForSymbolResponse.fromJson(jsonDecode(responseString));
            rs.streamController.add(contractsForSymbolResponse);
            break;

          case 'proposal':
            PriceProposalResponse priceProposalResponse = PriceProposalResponse.fromJson(jsonDecode(responseString));
            rs.streamController.add(priceProposalResponse);
            break;
        }

//        break;
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
