

part of '../../domain_repositories.dart';


abstract class SancionesRepository {
  //Se define que cosas quiero hacer
  //se definen los contratos

  Future<List<SancionesModel>> getSanciones(int parentId);

  Future<List<ConsultSanctionModel>> getSancionesPorFecha({required String fechaDesde,required String fechaHasta,required int idInstructor });



  Future<String> registreSanctions(SanctionsRequest sanctionsRequest);




}