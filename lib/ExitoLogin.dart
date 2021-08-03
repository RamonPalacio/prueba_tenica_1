import 'package:flutter/material.dart';

class ExitoLogin extends StatelessWidget {
  const ExitoLogin({Key? key}) : super(key: key);

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
                height: MediaQuery.of(context).size.height * 1,
                fit: BoxFit.cover),
          ),
        ]),
      ),
    );
  }
}
