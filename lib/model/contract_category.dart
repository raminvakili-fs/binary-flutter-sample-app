import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:flutter/cupertino.dart';

class ContractCategory {
  List<Category> categories = [];

  ContractCategory(
      {@required ContractsForSymbolResponse contractsForSymbolResponse}) {

    for (Available availableContract in contractsForSymbolResponse.contractsFor.available) {

      Category category = containsCategory(availableContract.contractCategory);

      if (category == null) {
        category = Category(
            categoryName: availableContract.contractCategory,
            categoryDisplayName: availableContract.contractCategoryDisplay,
            symbol: availableContract.underlyingSymbol);
        categories.add(category);
      }
      category.addContractType(available: availableContract);
    }
  }

  Category containsCategory(String categoryName) {
    for (Category c in categories) {
      if (c.categoryName == categoryName) {
        return c;
      }
    }
    return null;
  }
}

class Category {

  final String categoryName;
  final String categoryDisplayName;
  final String symbol;
  final List<ContractType> contractTypes = [];
  final List<String> availableDurations = [];

  Category({this.symbol, this.categoryDisplayName, this.categoryName});

  addContractType({Available available}) {
    if (!_containsContractType(available.contractType)) {
      contractTypes.add(ContractType(name: available.contractType, displayName: available.contractDisplay));
    }
  }

  bool _containsContractType(String name) {
    for (var c in contractTypes) {
      if (c.name == name){
        return true;
      }
    }
    return false;
  }

}

class ContractType {
  final String name;
  final String displayName;

  ContractType({this.name, this.displayName});
}

const typesPosition = {
  'CALL'        : 'top',
  'PUT'         : 'bottom',
  'CALLE'       : 'top',
  'PUTE'        : 'bottom',
  'ASIANU'      : 'top',
  'ASIAND'      : 'bottom',
  'DIGITMATCH'  : 'top',
  'DIGITDIFF'   : 'bottom',
  'DIGITEVEN'   : 'top',
  'DIGITODD'    : 'bottom',
  'DIGITOVER'   : 'top',
  'DIGITUNDER'  : 'bottom',
  'EXPIRYRANGEE': 'top',
  'EXPIRYMISSE' : 'bottom',
  'EXPIRYRANGE' : 'top',
  'EXPIRYMISS'  : 'bottom',
  'RANGE'       : 'top',
  'UPORDOWN'    : 'bottom',
  'ONETOUCH'    : 'top',
  'NOTOUCH'     : 'bottom',
  'LBFLOATCALL' : 'middle',
  'LBFLOATPUT'  : 'middle',
  'LBHIGHLOW'   : 'middle',
  'RESETCALL'   : 'top',
  'RESETPUT'    : 'bottom',
  'CALLSPREAD'  : 'top',
  'PUTSPREAD'   : 'bottom',
  'TICKHIGH'    : 'top',
  'TICKLOW'     : 'bottom',
  'RUNHIGH'     : 'top',
  'RUNLOW'      : 'bottom',
};


