import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/blocs/base_bloc.dart';
import 'package:rxdart/rxdart.dart';

class OpenContractBloc extends BaseBloc {
  final _proposalOpenContractResponse = BehaviorSubject<ProposalOpenContractResponse>();
  BehaviorSubject<ProposalOpenContractResponse> get proposalOpenContractResponse => _proposalOpenContractResponse;

  @override
  void dispose() {
    super.dispose();
    _proposalOpenContractResponse.close();
  }
}