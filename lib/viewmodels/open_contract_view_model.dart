import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class OpenContractViewModel extends BaseViewModel {
  final _proposalOpenContractResponse = BehaviorSubject<ProposalOpenContractResponse>();
  BehaviorSubject<ProposalOpenContractResponse> get proposalOpenContractResponse => _proposalOpenContractResponse;

  @override
  void dispose() {
    super.dispose();
    _proposalOpenContractResponse.close();
  }
}