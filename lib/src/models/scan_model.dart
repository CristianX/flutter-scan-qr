
// Paquete de Latitud y longitud
import 'package:latlong/latlong.dart';

class ScanModel {
    int id;
    String tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }) {
      if( valor.contains('http')) {
        this.tipo = 'http';
      } else {
        this.tipo = 'geo';
      }
    }

    // Crea una nueva instalncia de ScanModel
    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id    : json["id"],
        tipo  : json["tipo"],
        valor : json["valor"],
    );

    // Retorna un objeto del mismo tipo con formato Map
    Map<String, dynamic> toJson() => {
        "id"    : id,
        "tipo"  : tipo,
        "valor" : valor,
    };

    // Retornando latitud y longitud de geo
    LatLng getLatLng() {

      // substring(4) ignora los 4 primeros carácteres
      // split(',') corta por una coma y lo convierte en lista
      final latlng = valor.substring(4).split(',');
      final lat = double.parse(latlng[0]);
      final lng = double.parse(latlng[1]);

      // Returnando con el paquete LatLng.dart
      return LatLng( lat, lng );
    }
}