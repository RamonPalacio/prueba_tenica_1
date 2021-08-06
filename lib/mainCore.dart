import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/mainModelProvider.dart';
import 'package:prueba_tecnica_1/page3_ExitoLogin.dart';
import 'package:prueba_tecnica_1/page4_registrousuario.dart';

final loginCore = LoginCore();

class LoginCore {
  void btnOfuscar(ModelProvider provider) {
    provider.ofuscate = !provider.ofuscate;
  }

  void btnSignIn(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegistroPage()));
  }

  void btnSumit(BuildContext context) {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: false);

    if (provider.password == "12345" && provider.usuario == "admin") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExitoLoginPage()),
      );
    } else {
      showToast(
          text: "User or pasword invalid.",
          fondoColor: Color(0xFFFF0000),
          fontColor: Color(0xFFFFFFFF),
          fontSize: 15.0);
    }
  }
}

void showToast(
    {required String text,
    required Color fondoColor,
    required Color fontColor,
    double fontSize = 15.0}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 10,
      backgroundColor: fondoColor,
      textColor: fontColor,
      fontSize: fontSize);
}
