import 'package:flutter/widgets.dart';

class ModelProvider extends ChangeNotifier {
  // ModelProvider();
  Map _login = {
    "usuario": "",
    "password": "",
    "ofuscadopass": true,
  };

//? GETusuario
  String get usuario => _login["usuario"];
//? SETusuario
  set usuario(String newValue) {
    _login["usuario"] = newValue;
    notifyListeners();
  }

//? Getpassword
  String get password => _login["password"];
//? SETpassword
  set password(String newValue) {
    _login["password"] = newValue;
    print("cambio");
    notifyListeners();
  }

//? GETofuscadopass
  bool get ofuscate {
    return _login["ofuscadopass"];
  }

//? SETofuscadopass
  set ofuscate(bool newValue) {
    _login["ofuscadopass"] = newValue;
    notifyListeners();
  }
}
