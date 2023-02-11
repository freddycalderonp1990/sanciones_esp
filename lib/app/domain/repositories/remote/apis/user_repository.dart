part of '../../domain_repositories.dart';

abstract class UserRepository {
  //Se define que cosas quiero hacer
  //se definen los contartos

  Future<bool> registrarUser(UserRequest userRequest);
  Future<bool> updateClave({required int idUser, required String clave, required String claveNew});
}
