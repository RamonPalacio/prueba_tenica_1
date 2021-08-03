import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/login.dart';
import 'package:prueba_tecnica_1/provider_stados.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba Tecnica',
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFFB4B4B4, color),
          ),
          home: MyHomePage(
            title: 'Prueba Tecnica',
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Inicio();
  }
}

class Inicio extends StatelessWidget {
  const Inicio({
    Key? key,
  }) : super(key: key);

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
            // Image.network(
            //           'https://picsum.photos/seed/273/600',
            //           width: MediaQuery.of(context).size.width,
            //           height: MediaQuery.of(context).size.height * 1,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            // Align(
            //   alignment: Alignment(0, 0.5),
            //   child: Text('abda',
            //       style: TextStyle(fontSize: 60, color: Colors.white)),
            // ),
            // Align(
            //   alignment: Alignment(0, 0.55),
            //   child: Text('abda',
            //       style: TextStyle(fontSize: 20, color: Colors.white)),
            // ),
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
                    //Boton[index]
                    onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Page()),
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
