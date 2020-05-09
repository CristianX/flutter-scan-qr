import 'package:flutter/material.dart';

// Vistas
import 'package:lectorqr/src/pages/mapas_page.dart';
import 'package:lectorqr/src/pages/direcciones_page.dart';

// Barcode Scanner
import 'package:barcode_scan/barcode_scan.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escaner QR'),
        actions: <Widget>[
          IconButton( 
            icon: Icon(Icons.delete_forever),
            onPressed: (){},
           )
        ],
      ),
      body: _cargarPagina( currentIndex ),
      bottomNavigationBar: _crearBottomNavigationBar(),
      // Localización del floatingActionButton
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Creación de floatingActionButton
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: _scanQR,
        // Color de tema global para el floatingActionButton
        backgroundColor: Theme.of( context ).primaryColor,
      ),
    );
  }

 Widget _crearBottomNavigationBar() {
  //  Si solo hay un elemento, dará error
  return BottomNavigationBar(
    // currentIndex indica que elemento es el que está activo
    currentIndex: currentIndex,
    // Siempre debe recibir el elmento donde se hizo tap
    onTap: ( index ) {
      // Chekeando la opción en la cual se hizo tap
      setState(() {
        currentIndex = index;
      });
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon( Icons.map ),
        title: Text('Mapas')
      ),
      
      BottomNavigationBarItem(
        icon: Icon( Icons.brightness_5 ),
        title: Text('Direcciones')
      ),
    ],
  );
 }

  Widget _cargarPagina( int paginaActual ) {
    switch( paginaActual ) {
      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default:
      return MapasPage();
    }
  }

  // Escaneando QR
  _scanQR() async {

    // cristianx.github.io
    // geo:40.662799870614315,-74.26137342890628

    dynamic futureString = '';

  //   try {
  //     futureString = await BarcodeScanner.scan();
  //   } catch (e) {
  //     futureString = e.toString();
  //   }

  //   print('Future String: ${futureString.rawContent}');

  //   if( futureString != null ) {
  //     print('Tenemos Información');
  //   }

  }
}