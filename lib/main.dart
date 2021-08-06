import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_tecnica_1/mainModelProvider.dart';

import 'package:prueba_tecnica_1/page1_home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModelProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Prueba Tecnica',
          home: HomePage()),
    );
  }
}
