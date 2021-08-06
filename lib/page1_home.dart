import 'package:flutter/material.dart';
import 'package:prueba_tecnica_1/page2_login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-1, -1),
              child: Image(
                  image: AssetImage('assets/fondo.png'),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  fit: BoxFit.cover),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: SizedBox(
                height: 70,
                width: MediaQuery.of(context).size.width - 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(84, 104, 255, 50)),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(10)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.transparent)))),
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          )
                        },
                    child: Text(
                      "Get Started",
                      style: TextStyle(fontSize: 17),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
