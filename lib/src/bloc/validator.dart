
// Vañidación de http y de geo

// Stream Transformer
import 'dart:async';


// Modelo Scan
import 'package:lectorqr/src/models/scan_model.dart';

class Validators {

  // Creando Stream Transformer
  final validarGeo = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers( 


    // Si el scan que se evalua tiene la información para ser geo, se agrega al sink para que fluya en el Stream
    handleData: ( scans, sink ) {

      // Salida de Stream Transformer
      final geoScans = scans.where((s) =>  s.tipo == 'geo' ).toList();

      sink.add(geoScans);

    }
   );

   // Creando Stream Transformer
  final validarHttp = StreamTransformer<List<ScanModel>, List<ScanModel>>.fromHandlers( 


    // Si el scan que se evalua tiene la información para ser http, se agrega al sink para que fluya en el Stream
    handleData: ( scans, sink ) {

      // Salida de Stream Transformer
      final geoScans = scans.where((s) =>  s.tipo == 'http' ).toList();

      sink.add(geoScans);

    }
   );

}