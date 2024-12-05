import 'package:ejercicio_clima/src/pages/menu.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Consulta Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(),
    );
  }
}