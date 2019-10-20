import 'package:binary_mobile_app/model/serializable/categories/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/requests/buy_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/blocs/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PriceProposalBloc extends BaseBloc {

  final buyContractResponse = BehaviorSubject<BuyContractResponse>();

  final _priceProposalResponseTop = BehaviorSubject<PriceProposalResponse>();
  BehaviorSubject<PriceProposalResponse> get priceProposalTop => _priceProposalResponseTop;

  final _priceProposalResponseBottom = BehaviorSubject<PriceProposalResponse>();
  BehaviorSubject<PriceProposalResponse> get priceProposalBottom => _priceProposalResponseBottom;

  buyContract(BuyContractRequest buyContractRequest){
    isLoading.add(true);
    buyContractRequest.reqId = this.hashCode+4;
    binaryApi2.sendRequest(buyContractRequest).listen((response){
      buyContractResponse.add(response);
      isLoading.add(false);
    });
  }

  final _contractItem = BehaviorSubject<ContractTypeItem>();
  BehaviorSubject<ContractTypeItem> get contractItem => _contractItem;


  getPriceForContractTop(PriceProposalRequest priceProposalRequest){
    priceProposalRequest.reqId = this.hashCode+1;
    isLoading.add(true);
    binaryApi2.sendRequest(priceProposalRequest).listen((response){
      if (response != null) {
        _priceProposalResponseTop.add(response);
      }
      isLoading.add(false);
    });
  }

  getPriceForContractBottom(PriceProposalRequest priceProposalRequest){
    priceProposalRequest.reqId = this.hashCode+2;
    isLoading.add(true);
    binaryApi2.sendRequest(priceProposalRequest).listen((response){
      if (response != null) {
        _priceProposalResponseBottom.add(response);
      }
      isLoading.add(false);
    });
  }

  @override
  void dispose() {
    _priceProposalResponseTop.close();
    _priceProposalResponseBottom.close();
    _contractItem.close();
    super.dispose();
  }
}