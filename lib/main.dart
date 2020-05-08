import 'package:flutter/material.dart';

// Vistas
import 'package:lectorqr/src/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Quitando indicador de debug
      debugShowCheckedModeBanner: false,
      title: 'Lector QR',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage()
      }, 
      // Tema global
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}