
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

  // Cuando se ejecute conructor por primera vez
  ScansBloc._internal() {
    // Obtener Scans de la Base de datos
    obtenerScans();

  }

  final _scansStreamController = StreamController<List<ScanModel>>.broadcast();

  Stream <List<ScanModel>> get scansStream => _scansStreamController.stream;

  // Cerrando instancia del Stream
  dispose() {
    _scansStreamController?.close();
  }

  // Eventos (normalmente van en otro archivo events)


  obtenerScans() async {

    _scansStreamController.sink.add( await DBProvider.db.getTodosScans() );

  }


  agregarScan( ScanModel scan ) async {

    // Insertando en BDD
    await DBProvider.db.nuevoScan(scan);

    obtenerScans();
  }


  borrarScan( int id ) async{

    // Borrar los Scans seleccionados
    await DBProvider.db.deleteScan(id);

    // Guarda y vuelve todos los scans
    obtenerScans();

  }

  // En este caso async opcional
  borrarScansTodos() async {

    await DBProvider.db.deleteAll();

    obtenerScans();

    // También se puede hacer de esta manera
    // _scansStreamController.sink.add([]);

  }



  
}