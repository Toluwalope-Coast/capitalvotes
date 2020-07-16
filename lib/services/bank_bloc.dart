import 'package:flutter/cupertino.dart';

class BankBloc extends ChangeNotifier {
  String _bankCode;
  String _bankName;

  String get getBankCode => _bankCode;
  String get getBankName => _bankName;

  set setBankCode(String value) {
    _bankCode = value;
    notifyListeners();
  }

  set setBankName(String value) {
    _bankName = value;
    notifyListeners();
  }
}
