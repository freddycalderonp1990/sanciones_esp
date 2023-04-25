part of '../../bindings.dart';

class ConsultaSancionesBinding extends Bindings {
  @override
  void dependencies() {
    //Inyeccion de dependencias
    Get.lazyPut(() => ConsultaSancionesController(), fenix: true);


  }
}
