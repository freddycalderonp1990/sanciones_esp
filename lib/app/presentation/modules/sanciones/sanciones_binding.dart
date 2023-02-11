part of '../bindings.dart';

class SancionesBinding extends Bindings{
  @override
  void dependencies() {

    print("SancionesBinding-ok");
    //Inyeccion de dependencias
    Get.lazyPut(() => SancionesController());





  }

}