import 'package:flutter/material.dart';
import 'package:nac_flutter/screens/roupas_detalhes_screen.dart';
import 'package:nac_flutter/screens/roupas_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cursos App',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(247, 127, 0, 1.0),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RoupasScreen(),
        '/roupas_detalhes': (context) => RoupasDetalhesScreen(),
      },
    );
  }
}

/*
theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
*/
