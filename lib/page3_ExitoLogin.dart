import 'package:flutter/material.dart';

class ExitoLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment(-1, -1),
            child: Image(
                image: AssetImage('assets/fondo2.png'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover),
          ),
        ]),
      ),
    );
  }
}
