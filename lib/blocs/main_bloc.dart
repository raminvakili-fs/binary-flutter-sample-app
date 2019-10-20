

import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/tick_stream_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MainBloc extends ChangeNotifier {

  BinaryApi2 binaryApi2;

  BehaviorSubject<TickStreamResponse> _tickStream = BehaviorSubject<TickStreamResponse>();

  BehaviorSubject<TickStreamResponse> get tickStream => _tickStream;

  getTickStream({String ticks, int subscribe}){
    _setLoading(true);
    binaryApi2.sendRequest(TickStreamRequest(this.hashCode, ticks, subscribe)).listen((snapshot){
      if(snapshot != null)
        _tickStream.add(snapshot);
      _setLoading(false);
    });
  }


  PriceProposalResponse _priceProposalResponse;

  PriceProposalResponse get priceProposal => _priceProposalResponse;

  getPriceForContract(PriceProposalRequest priceProposalRequest){
    binaryApi2.sendRequest(priceProposalRequest).listen((response){
      if (response != null) {
        _priceProposalResponse = response;
      }
    });
  }

  ActiveSymbolsResponse _activeSymbolsResponse;

  ActiveSymbolsResponse get activeSymbols => _activeSymbolsResponse;

  getActiveSymbols(ActiveSymbolsRequest activeSymbolsRequest){
    activeSymbolsRequest.reqId = this.hashCode+2;
    binaryApi2.sendRequest(activeSymbolsRequest).listen((response){
      if (response != null) {
        _activeSymbolsResponse = response;
        notifyListeners();
      }
    });
  }


  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  _setLoading(bool loading) {
    _isLoading = loading;
  }

  MainBloc(){
    binaryApi2 = BinaryApi2.getInstance;
    print("MainScreenViewModel instantiated");
  }

  @override
  void dispose() {
    super.dispose();
    _tickStream.close();
  }


}