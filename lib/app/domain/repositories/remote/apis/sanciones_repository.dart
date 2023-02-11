

part of '../../domain_repositories.dart';


abstract class SancionesRepository {
  //Se define que cosas quiero hacer
  //se definen los contartos

  Future<List<Sancion>> getSanciones(int parentId);




}