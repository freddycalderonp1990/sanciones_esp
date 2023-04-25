part of '../../domain_repositories.dart';

abstract class PersonRepository {
  //Se define que cosas quiero hacer
  //se definen los contartos

  Future<CadeteModel> getDataCadete(String cedula);

}
