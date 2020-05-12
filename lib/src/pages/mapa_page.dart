import 'package:flutter/material.dart';

// Modelos
import 'package:lectorqr/src/models/scan_model.dart';


class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Para mandar argumentos en el navigator
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(

      appBar: AppBar(
        title: Text('Coordernadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.my_location ),
            onPressed: (){},
          )
        ],
      ),

      body: Center(
        child: Text( scan.valor ),
      ),
      
    );
  }
}