import 'dart:convert';

import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/tick_stream_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/response_base.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
//  test('Built Value Request', () async {

//    RequestBase requestBase = RequestBase((rb){
//      rb.reqId = 1;
//    });
//
//    print("${requestBase.reqId}");
//
//
//    ActiveSymbolsRequest activeSymbolsRequest = ActiveSymbolsRequest((asr) {
//      asr.reqId = 1;
//      asr.activeSymbols = 'brief';
//      asr.productType = 'basic';
//    });
//
//    print("${activeSymbolsRequest.reqId}");
//
//    AuthorizeRequest authorizeRequest = AuthorizeRequest((asr) {
//      asr.reqId = 1;
//      asr.authorize = "sdasdsd jskdkad";
//    });
//
//    print("${authorizeRequest.reqId}");
//
//  });
//
//  test('Built Value Response Base', () async {
//    var response  = "{\"active_symbols\": [{\"allow_forward_starting\": 0,\"display_name\": \"AUD Index\",\"exchange_is_open\": 1,\"is_trading_suspended\": 0,\"market\": \"forex\",\"market_display_name\": \"Forex\",\"pip\": 0.001,\"submarket\": \"smart_fx\",\"submarket_display_name\": \"Smart FX\",\"symbol\": \"WLDAUD\",\"symbol_type\": \"smart_fx\"}],\"msg_type\": \"active_symbols\",\"req_id\": 2}";
//
//
//    ResponseBase responseBase = ResponseBase.fromJson(response);
//
//    print("${responseBase.msgType}   ${responseBase.reqId}");
//
//    ActiveSymbolsResponse activeSymbolsResponse = ActiveSymbolsResponse.fromJson(jsonDecode(response));
//
//    print("${activeSymbolsResponse.reqId}");
//
//    print("${activeSymbolsResponse.activeSymbols.map((s){
//      print(s.displayName);
//    })}");
//
//  });


  test('Active symbols test built value', () async {
    const String PRICE_PROPOSAL_RESPONSE = "{\"req_id\": 1,\"echo_req\": {\"amount\": 100,\"barrier\": \"+0.1\",\"basis\": \"payout\",\"contract_type\": \"CALL\",\"currency\": \"USD\",\"duration\": 60,\"duration_unit\": \"s\",\"product_type\": \"basic\",\"proposal\": 1,\"subscribe\": 1,\"symbol\": \"R_100\"},\"msg_type\": \"proposal\",\"proposal\": {\"ask_price\": 49.93,\"date_start\": 1569606676,\"display_value\": \"49.93\",\"id\": \"892ac329-1e4b-fed0-046a-36e5bb280ff7\",\"longcode\": \"Win payout if Volatility 100 Index is strictly higher than entry spot plus 0.10 at 1 minute after contract start time.\",\"payout\": 100,\"spot\": 1906.73,\"spot_time\": 1569606674},\"subscription\": {\"id\": \"892ac329-1e4b-fed0-046a-36e5bb280ff7\"}}";

    PriceProposalResponse response = PriceProposalResponse.fromJson(
        jsonDecode(PRICE_PROPOSAL_RESPONSE));

    print("Price proposal ${response.proposal.askPrice}");

    expect(response.reqId, 1);
  });

  test('Contracts for symbols json test', () async {

    BinaryApi2 api2 = BinaryApi2.getInstance;
    api2.sendRequest(ContractsForSymbolRequest(reqId: 2,
        contractsFor: 'R_50',
        currency: 'USD',
        productType: 'basic',
        landingCompany: 'svg')).listen((response){

          var res = response as ContractsForSymbolResponse;

          print(response.toJson());

    });
  });

  test('Buy contract json test', () async {
    var res = "{\"buy\": {\"balance_after\": 9779.14,\"buy_price\": 49.92,\"contract_id\": 58774758868,\"longcode\": \"Win payout if Volatility 100 Index is strictly higher than entry spot plus 0.10 at 1 minute after contract start time.\",\"payout\": 100,\"purchase_time\": 1569841840,\"shortcode\": \"CALL_R_100_100_1569841840_1569841900_S10P_0\",\"start_time\": 1569841840,\"transaction_id\": 117501213948},\"subscription\": {\"id\": \"f8dbf71a-a5ba-55f6-f82e-0bf8ee32d55a\"}}";

    BuyContractResponse buyContractResponse = BuyContractResponse.fromJson(jsonDecode(res));

    prints(buyContractResponse.toJson().toString());

    expect(buyContractResponse.buy.payout, 100);

  });

  test("buy contract response", (){
    var json = "{\"error\": {\"code\": \"ContractBuyValidationError\", \"message\": \"The contract must expire on a trading day.\"}, \"msg_type\": \"proposal\", \"req_id\": 777186511}";

    BuyContractResponse priceProposalResponse = BuyContractResponse.fromJson(jsonDecode(json));

    expect(priceProposalResponse.error.code, "ContractBuyValidationError");

  });
}


