# lectorqr

A new Flutter project.

# Dependencias
- Barcode Scan `barcode_scan: ^3.0.1`
- Sqflite `sqflite: ^1.3.0`
<!-- Para saber la dirección donde se encuentra el archivo de la BDD físicamente en el dispositivo -->
- Path Provider `path_provider: ^1.6.7` 
- Url Launcher `url_launcher: ^5.4.5` <!--Lanzae url o geo scaneada-->
- Flutter Map `flutter_map: ^0.9.0` <!--Package para mostrar mapa--> <!-- Usar la versión ^0.8.0 para el cambio de mapa -->
- latlong `latlong: ^0.6.1` <!--Paquete para leer latitud y longitud-->

### Importante
En android\app\build.gradle cambiar `minSdkVersion` de 16 a 18 y realizar la implementación de permisos que requiere el paquete de Barcode Scanner

### Herramienta de modelado en JSON para Dart
https://app.quicktype.io/

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
