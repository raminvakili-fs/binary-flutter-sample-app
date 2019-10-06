import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:flutter/cupertino.dart';

class ContractCategory {
  List<Category> categories = [];

  ContractCategory(
      {@required ContractsForSymbolResponse contractsForSymbolResponse}) {

    for (Available availableContract in contractsForSymbolResponse.contractsFor.available) {

      Category category = _containsCategory(availableContract.contractCategory);

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

  Category _containsCategory(String categoryName) {
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
      contractTypes.add(ContractType(name: available.contractType, displayName: available.contractDisplay, position: typesPosition[available.contractType]));
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
  final Position position;

  ContractType({this.name, this.displayName, this.position});
}

const typesPosition = {
  'CALL'        : Position.TOP,
  'PUT'         : Position.BOTTOM,
  'CALLE'       : Position.TOP,
  'PUTE'        : Position.BOTTOM,
  'ASIANU'      : Position.TOP,
  'ASIAND'      : Position.BOTTOM,
  'DIGITMATCH'  : Position.TOP,
  'DIGITDIFF'   : Position.BOTTOM,
  'DIGITEVEN'   : Position.TOP,
  'DIGITODD'    : Position.BOTTOM,
  'DIGITOVER'   : Position.TOP,
  'DIGITUNDER'  : Position.BOTTOM,
  'EXPIRYRANGEE': Position.TOP,
  'EXPIRYMISSE' : Position.BOTTOM,
  'EXPIRYRANGE' : Position.TOP,
  'EXPIRYMISS'  : Position.BOTTOM,
  'RANGE'       : Position.TOP,
  'UPORDOWN'    : Position.BOTTOM,
  'ONETOUCH'    : Position.TOP,
  'NOTOUCH'     : Position.BOTTOM,
  'LBFLOATCALL' : Position.MIDDLE,
  'LBFLOATPUT'  : Position.MIDDLE,
  'LBHIGHLOW'   : Position.MIDDLE,
  'RESETCALL'   : Position.TOP,
  'RESETPUT'    : Position.BOTTOM,
  'CALLSPREAD'  : Position.TOP,
  'PUTSPREAD'   : Position.BOTTOM,
  'TICKHIGH'    : Position.TOP,
  'TICKLOW'     : Position.BOTTOM,
  'RUNHIGH'     : Position.TOP,
  'RUNLOW'      : Position.BOTTOM,
};

enum Position {
  TOP, BOTTOM, MIDDLE
}


