
// Implementado con Patron Blog

// Streams
import 'dart:async';

// Provider
import 'package:lectorqr/src/providers/db_provider.dart';


class ScansBloc {

  // Patrón singleton para una sola instancia
  static final ScansBloc _singleton = new ScansBloc._internal();

  // El constructor al ser factory retorna una nueva instancia o cualquier otra cosa
  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    // Obtener Scans de la Base de datos

  }

  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream <List<ScanModel>> get scansStream => _scansStreamController.stream;

  // Cerrando instancia del Stream
  dispose() {
    _scansStreamController?.close();
  }



  
}