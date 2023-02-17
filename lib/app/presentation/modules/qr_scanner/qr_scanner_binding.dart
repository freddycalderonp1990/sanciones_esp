part of '../bindings.dart';

class QrScannerBinding extends Bindings{
  @override
  void dependencies() {

    print("QrScannerBinding-ok");
    //Inyeccion de dependencias
    Get.lazyPut(() => QrScannerController());





  }

}