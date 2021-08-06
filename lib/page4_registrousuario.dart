import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/mainModelProvider.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    ModelProvider provider = Provider.of<ModelProvider>(context, listen: false);

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
                        TextField(
                          style: TextStyle(
                              fontSize: 25.0, color: Color(0xFFFFFFFF)),
                          decoration: InputDecoration(
                            hoverColor: Color(0x00FF0000),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 20),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelText: 'Full Name',
                            fillColor: Color(0xFF5A5A5A),
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                              fontSize: 25.0, color: Color(0xFFFFFFFF)),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hoverColor: Color(0x00FF0000),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 20),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelText: 'Email Address',
                            fillColor: Color(0xFF5A5A5A),
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                              fontSize: 25.0, color: Color(0xFFFFFFFF)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hoverColor: Color(0x00FF0000),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 20),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            labelText: 'Phone Number',
                            fillColor: Color(0xFF5A5A5A),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Container(
                      child: TextField(
                        // controller: pass_controler,
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
