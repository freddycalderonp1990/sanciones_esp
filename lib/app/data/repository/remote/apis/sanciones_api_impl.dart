part of '../../data_repositories.dart';

class SancionesApiImpl extends SancionesRepository {
  final SancionesApiProviderImpl  _sancionesProviderImpl;

  SancionesApiImpl(this._sancionesProviderImpl);

  @override
  Future<List<SancionesModel>> getSanciones(int parentId) async {
    try {


      return   await _sancionesProviderImpl.getSanciones( parentId);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }


  Future<List<SancionesModel>> getSancionesLeves() async {
    try {

      return   await getSanciones(2);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }

  @override
  Future<String> registreSanctions(SanctionsRequest sanctionsRequest) async {
    try {
      return   await _sancionesProviderImpl.registreSanctions(sanctionsRequest);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }

  @override
  Future<List<ConsultSanctionModel>> getSancionesPorFecha({required String fechaDesde, required String fechaHasta, required int idInstructor}) async {

      return   await _sancionesProviderImpl.getSancionesPorFecha(fechaDesde: fechaDesde, fechaHasta: fechaHasta,idInstructor: idInstructor);

  }


}
