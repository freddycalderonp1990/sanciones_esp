import 'exceptions.dart';

class ExceptionHelper {
  static captureError(Object e) {
    if (e is ServerException) {
      print("server error: ${e.cause}");
      throw ServerException(cause: e.cause);
    } else {
      print("server error2: ${e.toString()}");
      throw ServerException.msj(e.toString());

    }

  }

}
