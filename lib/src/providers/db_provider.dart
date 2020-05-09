
// Patrón singleton para tener solo una instancia del provider de manera global

// SQFlite
import 'package:sqflite/sqflite.dart';

// Provider Path
import 'package:path_provider/path_provider.dart';

// Join
import 'package:path/path.dart';

// Directory
import 'dart:io';


// Modelos
import 'package:lectorqr/src/models/scan_model.dart';

class DBProvider {

  static Database _database;

  // Constructor privado (lo indica el ._ de DBProvider)
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if( database != null ) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {

    // Definiendo path donde se encuentra la bd
    Directory directorioDocumentos = await getApplicationDocumentsDirectory();

    // Nobre de la BDD "ScansDB.db"
    // Join une el path con el nombre de la BDD
    final path = join( directorioDocumentos.path, 'ScansDB.db' );

    return await openDatabase(
      path,
      // Cuando se cree más tablas, campos, etc, aumentar la versión en 1 (+1)
      version: 1,
      onOpen: (db) {},
      onCreate: ( Database db, int version ) async {
        // Inicialización de la BDD
        await db.execute( 
          'CREATE TABLE Scans ('
          ' id INTEGER PRIMARY KEY,'
          ' tipo TEXT,'
          ' valor TEXT '
          ')'
         );
      }
    );


  }

  // CREAR Registros
  // nuevoScanRow( ScanModel nuevoScan ) async {

  //   // Verificando si la BDD está lista para escribir en ella
  //   final db = await database;

  //   final resultado = await db.rawInsert(
  //     "INSERT Into Scans (id, tipo, valor) VALUES ( '${ nuevoScan.id }', '${ nuevoScan.tipo }', '${ nuevoScan.valor }')"
  //   );

  //   return resultado;

  // }

  // CREAR Registros, método más optimizado
  nuevoScan( ScanModel nuevoScan ) async {
    
    // Verificando si la BDD está lista para escribir en ella
    final db = await database;

    final respuesta = db.insert('Scans', nuevoScan.toJson());

    return respuesta;

  }
}