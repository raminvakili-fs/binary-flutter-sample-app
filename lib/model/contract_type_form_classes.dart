import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:flutter/material.dart';

class UnimplementedContractItem extends ContractTypeItem {

  @override
  Widget createForm() {
    // TODO: implement createForm
    return Container(child: Center(child: Text('Unimplemented!')),);
  }

  @override
  PriceProposalRequest createRequest() {
    // TODO: implement createRequest
    return null;
  }

}

class DigitsContractItem extends ContractTypeItem {

  final List<int> lastDigitRanges;

  DigitsContractItem({this.lastDigitRanges});

  @override
  Widget createForm() {
    return null;
  }

  @override
  PriceProposalRequest createRequest() {
    return null;
  }
}