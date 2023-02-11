import 'package:get/get.dart';
import '../../../app/presentation/routes/app_routes.dart';

import '../../domain/repositories/domain_repositories.dart';
import '../app_config.dart';



abstract class Failure implements Exception {
  final String message;

  Failure({
    required this.message,
  });

  get msj=>message;


}

class ServerException implements Exception {
  final String cause;


  ServerException( { required this.cause});


  factory ServerException.msj(msjException
   ) {
    String mesage = 'No es posible conectar con el servidor. Contacte con el administrador';

    if (AppConfig.AmbienteUrl != Ambiente.produccion && AppConfig.AmbienteUrl != Ambiente.prueba) {
      mesage = mesage + ' Exception: ' + msjException;
    }

    return ServerException(cause:mesage);
  }

  factory ServerException.StatusCode(
      {int statusCode = 0,

      String msjException = ''}) {
    String mesage = 'No definido';

    switch (statusCode) {
      case 404: //HTTP_NOT_FOUND
        mesage =
            "No es posible conectar con el servidor. Pagina no encontrada.";
        break;

      case 400: //HTTP_Bad_Request
        mesage = "No es posible conectar con el servidor. Solicitud incorrecta (Faltan campos por enviar)";
        break;

      case 401: //HTTP_No_autorizado
        mesage = "La sesión ha expirado.";

        Get.offAllNamed(AppRoutes.SPLASH);
        break;

      case 423: //HTTP_No_autorizado
        mesage = "No se encuntra activo.";

        Get.offAllNamed(AppRoutes.SPLASH);
        break;

      case 500: //HTTP_Bad_Request
        mesage = "Ocurrio un problema con el servidor. Vuelva a intentar. \nSi el problema persiste contacte con el administrador. ";
        break;

      default:
        mesage = 'No  es posible conectar con el servidor.'
            '\nPor favor revise su conexión a internet y vuelve a ejecutar la acción. '
            '\nSi el problema persiste contacte con el administrador.  ';
        break;
    }

    if (AppConfig.AmbienteUrl != Ambiente.produccion && AppConfig.AmbienteUrl != Ambiente.prueba) {
      mesage = mesage + ' Exception: ' + msjException;
    }

    return ServerException(cause:mesage);
  }
}




class CacheException implements Exception {}
