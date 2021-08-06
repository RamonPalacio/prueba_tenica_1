import 'package:flutter/widgets.dart';

class ModelProvider extends ChangeNotifier {
  // ModelProvider();
  Map _login = {
    "usuario": "",
    "password": "",
    "ofuscadopass": true,
  };

  dynamic getLoginModel(value) {
    return _login[value];
  }

  void setLoginModel(String variable, dynamic newValue) {
    _login[variable] = newValue;
    notifyListeners();
  }

  Map _registro = {
    "name": "",
    "email": "",
    "phone": "",
    "password": "",
    "ofuscadopass": true,
  };

  dynamic getRegistroModel(value) {
    return _registro[value];
  }

  void setRegistroModel(String variable, dynamic newValue) {
    _registro[variable] = newValue;
    notifyListeners();
  }
}
