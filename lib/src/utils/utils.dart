// Url Launcher
import 'package:url_launcher/url_launcher.dart';


// Modelos
import 'package:lectorqr/src/models/scan_model.dart';





abrirScan( ScanModel scan ) async {


  // Validación http/ge/ etc
  if( scan.tipo == 'http' ){

    if (await canLaunch( scan.valor )) {
      await launch( scan.valor );
    } else {
      throw 'Could not launch ${ scan.valor }';
    }

  } else {
    print('GEO...');
  }

}
