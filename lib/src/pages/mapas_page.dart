import 'package:lectorqr/src/bloc/scans_bloc.dart';

// // Provider
// import 'package:lectorqr/src/providers/db_provider.dart';

// Bloc Stream
import 'package:flutter/material.dart';

// Modelos
import 'package:lectorqr/src/models/scan_model.dart';

// Utilidades
import 'package:lectorqr/src/utils/utils.dart' as utils;

class MapasPage extends StatelessWidget {

  // Instancia bloc
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {

    // Redibujando para correción de carga infinita
    scansBloc.obtenerScans();

    // Cambiando Futurebuilder por StreamBuilder
    return StreamBuilder<List<ScanModel>>(
      // future: DBProvider.db.getTodosScans(),

      // Escuchando stream
      stream: scansBloc.scansStream,
      builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
        if( !snapshot.hasData ) {
          return Center( child: CircularProgressIndicator(), );
        }

        final scans = snapshot.data;

        if( scans.length == 0 ) {
          return Center(
            child: Text('No hay información'),
          );
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: ( context, i ) => Dismissible(
            // Creando llave única para el Dismissible
            key: UniqueKey(),
            background: Container( color: Colors.red ),
            // Método que se llamara al deslizar el Dismissible
            // onDismissed: ( direction ) => DBProvider.db.deleteScan( scans[i].id ),

            // Método que se llamara al deslizar el Dismissible con el stream
            onDismissed: (direction) => scansBloc.borrarScan( scans[i].id ),

            child: ListTile(
              leading: Icon( Icons.map, color: Theme.of(context).primaryColor, ),
              title: Text(scans[i].valor),
              subtitle: Text('ID: ${ scans[i].id }'),
              trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey, ),
              // Llamando utilidades de launch url
              onTap: () => utils.abrirScan( context, scans[i] ),
            ),
          ),
        );
      },
    );
  }
}