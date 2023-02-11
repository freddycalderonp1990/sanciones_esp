part of '../../domain_repositories.dart';

abstract class FirebaseConfigRepository {
  //Se define que cosas quiero hacer
  //se definen los contartos

  Future<String> getUrlHostApp();

}