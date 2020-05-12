import 'package:flutter/material.dart';


// Modelos
import 'package:lectorqr/src/models/scan_model.dart';

// Certificado
// import 'package:lectorqr/src/certificate/certificate.dart';

// Paquete FlutterMap
import 'package:flutter_map/flutter_map.dart';


class MapaPage extends StatefulWidget {

  
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  // Controlador de flutter map
  final map = new MapController();

  // Cambio de estilo de mapa
    String tipoMapa = 'streets'; 

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
            onPressed: (){

              // Mover mapa hasta donde está el marcador
              map.move( scan.getLatLng() , 15 );
            },
          )
        ],
      ),

      body: _crearFlutterMap( scan ),
      floatingActionButton: _cambioDeEstiloDeMapa( context ),
      
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {

    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15
      ),
      // Capas de información
      layers: [
        _crearMapa(),
        _crearMarcadores( scan )
      ],
    );

  }

   LayerOptions _crearMapa() {

    return TileLayerOptions(
      // @2x.png es para alta resolución
      urlTemplate: 'https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      
      // Para mandar el accessToken y el id
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        // mapbox.streets mapa genérico
        'id': 'mapbox.$tipoMapa' // streets, dark, light, outdoors, satellite
      }
    );

  }

  MarkerLayerOptions _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),

          // Para que se dibuje el marcador
          // El retorno del builder puede ser cualquier widget
          builder: (context) => Container(
            child: Icon(Icons.location_on, size: 70.0, color: Theme.of( context ).primaryColor),
          )
        )
      ]
    );
  }

  Widget _cambioDeEstiloDeMapa(BuildContext context) {
    return FloatingActionButton(
      child: Icon( Icons.repeat ),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: (){

        // Dibujando cambios en la app
        setState(() {
          
          if( tipoMapa == 'streets' ) {
            tipoMapa = 'dark';
          } else if ( tipoMapa == 'dark' ) {
            tipoMapa = 'light';
          } else if ( tipoMapa == 'light' ) {
            tipoMapa = 'outdoors';
          } else if( tipoMapa == 'outdoors' ) {
            tipoMapa = 'satellite';
          } else {
            tipoMapa = 'streets';
          }
        });

      }
    );
  }
}