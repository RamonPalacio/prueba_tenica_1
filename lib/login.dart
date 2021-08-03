import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/ExitoLogin.dart';
import 'package:prueba_tecnica_1/provider_stados.dart';
import 'package:prueba_tecnica_1/registrousuario.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: false);
    final user_controler = TextEditingController(text: provider.usuario);

    final TextEditingController pass_controler =
        TextEditingController(text: provider.password);
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
                    child: TextField(
                      // autofocus: false,
                      onChanged: (text) {
                        provider.usuario = text;
                        user_controler.selection = TextSelection.fromPosition(
                            TextPosition(offset: user_controler.text.length));
                      },
                      controller: user_controler,
                      style:
                          TextStyle(fontSize: 25.0, color: Color(0xFFFFFFFF)),
                      decoration: InputDecoration(
                        hoverColor: Color(0x00FF0000),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 20),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          // borderSide: BorderSide(color: Colors.red)),
                        ),
                        labelText: 'User',
                        fillColor: Color(0xFF5A5A5A),
                        filled: true,
                        suffixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Container(
                      child: TextField(
                        onChanged: (text) {
                          provider.password = text;
                          pass_controler.selection = TextSelection.fromPosition(
                              TextPosition(offset: pass_controler.text.length));
                        },
                        controller: pass_controler,
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Color(0xFFFFFFFF),
                        ),
                        obscureText: provider.ofuscate,
                        decoration: InputDecoration(
                          fillColor: Color(0xFF5A5A5A),
                          filled: true,
                          hoverColor: Color(0x00FF0000),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              provider.ofuscate = !provider.ofuscate;
                              setState(() {});
                            },
                            icon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
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
                        onPressed: () => {
                              if (provider.password == "12345" &&
                                  provider.usuario == "admin")
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExitoLogin()),
                                  )
                                }
                              else
                                {
                                  Fluttertoast.showToast(
                                      msg: "User or pasword invalid.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 10,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 15.0),
                                }
                            },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFB4B4B4)),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(10)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF000000)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: Colors.transparent)))),
                        //Boton[index]
                        onPressed: null,
                        child: Text(
                          "Sign In with Google",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        )),
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
                      TextButton(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF0099FF),
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistroPage()));
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
