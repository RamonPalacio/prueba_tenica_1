import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/MainCore.dart';
import 'package:prueba_tecnica_1/mainModelProvider.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final TextEditingController nameControler = TextEditingController();
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController phoneControler = TextEditingController();
  final TextEditingController passControler = TextEditingController();

  @override
  void dispose() {
    nameControler.dispose();
    emailControler.dispose();
    phoneControler.dispose();
    passControler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: false);
    super.initState();
    nameControler.text = provider.getRegistroModel("name");
    emailControler.text = provider.getRegistroModel("email");
    phoneControler.text = provider.getRegistroModel("phone");
    passControler.text = provider.getRegistroModel("password");
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
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Create new account",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Please fill in the form to continue",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF575757),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Column(
                      children: [
                        //! TEXTBOX FullName
                        FullName(provider, "name", nameControler, "Full Name"),
                        SizedBox(height: 10),
                        FullName(
                            provider, "email", emailControler, "Email Address"),
                        SizedBox(height: 10),
                        FullName(
                            provider, "phone", phoneControler, "Phone Number"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Container(
                      child: TextField(
                        onChanged: (text) =>
                            provider.setRegistroModel("password", text),
                        controller: passControler,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFFFFFFFF),
                        ),
                        obscureText: provider.getRegistroModel("ofuscadopass"),
                        decoration: InputDecoration(
                          fillColor: Color(0xFF5A5A5A),
                          filled: true,
                          hoverColor: Color(0x00FF0000),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          labelText: 'Password',
                          suffixIcon: BtnOfuscar(
                            provider: provider,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(84, 104, 255, 50)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.transparent)))),
                        onPressed: () => {Navigator.pop(context)},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      Text(
                        "Have an Account?  ",
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFF555555)),
                      ),
                      TextButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0099FF),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
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

// ignore: must_be_immutable
class FullName extends StatelessWidget {
  FullName(
      this.provider, this.providerPropiedad, this.passControler, this.caption);

  ModelProvider provider;
  final TextEditingController passControler;
  final String caption;
  final String providerPropiedad;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (text) => provider.setRegistroModel(providerPropiedad, text),
      controller: passControler,
      style: TextStyle(fontSize: 25.0, color: Color(0xFFFFFFFF)),
      decoration: InputDecoration(
        labelText: caption,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        filled: true,
        fillColor: Color(0xFF5A5A5A),
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
      onPressed: () => registroCore.btnOfuscar(provider),
      icon: Icon(provider.getRegistroModel("ofuscadopass")
          ? Icons.remove_red_eye_rounded
          : Icons.remove_red_eye_outlined),
    );
  }
}
