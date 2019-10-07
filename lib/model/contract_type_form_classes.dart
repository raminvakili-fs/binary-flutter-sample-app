import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';

class UnimplementedContractItem extends ContractTypeItem {


  @override
  PriceProposalRequest createRequest() {
    // TODO: implement createRequest
    return null;
  }

}

class DigitsContractItem extends ContractTypeItem {

  final List<int> lastDigitRanges;
  int selectedDigit;

  DigitsContractItem({this.lastDigitRanges}){
    if (lastDigitRanges != null && lastDigitRanges.length > 0) {
      selectedDigit = lastDigitRanges[0];
    }
  }


  @override
  PriceProposalRequest createRequest() {
    return null;
  }
}