part of '../../data_repositories.dart';

class SancionesApiImpl extends SancionesRepository {
  final SancionesApiProviderImpl _sancionesProviderImpl = Get.find();



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


}
