part of '../../data_repositories.dart';

class SancionesApiImpl extends SancionesRepository {
  final  _sancionesProviderImpl;

  SancionesApiImpl(this._sancionesProviderImpl);

  @override
  Future<List<Sancion>> getSanciones(int parentId) async {
    try {


      return   await _sancionesProviderImpl.getSanciones( parentId);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }


  Future<List<Sancion>> getSancionesLeves() async {
    try {

      return   await getSanciones(2);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }

  @override
  Future<bool> registreSanctions(SanctionsRequest sanctionsRequest) async {
    try {
      return   await _sancionesProviderImpl.registreSanctions(sanctionsRequest);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }


}
