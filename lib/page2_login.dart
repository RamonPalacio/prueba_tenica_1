import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/mainCore.dart';
import 'package:prueba_tecnica_1/mainModelProvider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userControler = TextEditingController();
  final TextEditingController passControler = TextEditingController();

  @override
  void dispose() {
    userControler.dispose();
    passControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: false);
    super.initState();
    userControler.text = provider.getLoginModel("usuario");
    passControler.text = provider.getLoginModel("password");
  }

  @override
  Widget build(BuildContext context) {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: const Color(0xFF191A1F),
      body: SafeArea(
        child: Stack(children: [
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: ListView(
                children: [
                  SizedBox(height: 70),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Please sign in to your account",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF575757),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    // height: 0,
                    width: MediaQuery.of(context).size.width - 100,
                    //! TEXTBOX User
                    child: TextUser(
                        provider: provider, userControler: userControler),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Container(
                      //! TEXTBOX Password
                      child: TextPasword(
                          provider: provider, passControler: passControler),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        "Forgot Password?",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF555555)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    //! BOTON btn_Sumit
                    child: BtnSumit(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: BtnSignInGoogle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        "Don´t have on Account?  ",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF555555)),
                      ),
                      //! BOTON btn_SignIn
                      BtnSignIn(),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class TextUser extends StatelessWidget {
  const TextUser({
    required this.provider,
    required this.userControler,
  });

  final ModelProvider provider;
  final TextEditingController userControler;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) => provider.setLoginModel("usuario", text),
      controller: userControler,
      style: TextStyle(fontSize: 25.0, color: Color(0xFFFFFFFF)),
      decoration: InputDecoration(
        hoverColor: Color(0x00FF0000),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        labelText: 'User',
        fillColor: Color(0xFF5A5A5A),
        filled: true,
        suffixIcon: const Icon(Icons.lock),
      ),
    );
  }
}

class TextPasword extends StatelessWidget {
  const TextPasword({
    required this.provider,
    required this.passControler,
  });

  final ModelProvider provider;
  final TextEditingController passControler;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      onChanged: (text) => provider.setLoginModel("password", text),
      controller: passControler,
      style: TextStyle(
        fontSize: 22.0,
        color: Color(0xFFFFFFFF),
      ),
      obscureText: provider.getLoginModel("ofuscadopass"),
      decoration: InputDecoration(
        fillColor: Color(0xFF5A5A5A),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        labelText: 'Password',
        //! BOTON btn_SignIn
        suffixIcon: BtnOfuscar(provider: provider),
      ),
    );
  }
}

class BtnOfuscar extends StatelessWidget {
  const BtnOfuscar({
    required this.provider,
  });

  final ModelProvider provider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => loginCore.btnOfuscar(provider),
      icon: Icon(provider.getLoginModel("ofuscadopass")
          ? Icons.remove_red_eye_rounded
          : Icons.remove_red_eye_outlined),
    );
  }
}

class BtnSumit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(84, 104, 255, 50)),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent)))),
        onPressed: () {
          loginCore.btnSumit(context);
        },
        child: Text(
          "Sign In",
          style: TextStyle(fontSize: 20),
        ));
  }
}

class BtnSignInGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFB4B4B4)),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
            foregroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF000000)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.transparent)))),
        //Boton[index]
        onPressed: null,
        child: Text(
          "Sign In with Google",
          style: TextStyle(
            fontSize: 18,
          ),
        ));
  }
}

class BtnSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        "Sign In",
        style: TextStyle(
            fontSize: 20,
            color: Color(0xFF0099FF),
            fontWeight: FontWeight.bold),
      ),
      onPressed: () => loginCore.btnSignIn(context),
    );
  }
}
