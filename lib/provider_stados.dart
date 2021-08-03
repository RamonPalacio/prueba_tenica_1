import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ModelProvider extends ChangeNotifier {
  // ModelProvider();

  String _usuario = '';

  String get usuario => _usuario;
  void set usuario(String newValue) {
    this._usuario = newValue;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;
  void set password(String newValue) {
    this._password = newValue;
    notifyListeners();
  }

  bool _ofuscate = true;
  bool get ofuscate => _ofuscate;
  void set ofuscate(bool newValue) {
    this._ofuscate = newValue;
    notifyListeners();
  }
}
