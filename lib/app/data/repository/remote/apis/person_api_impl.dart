part of '../../data_repositories.dart';

class PersonApiImpl extends PersonRepository {
  final  _personProviderImpl;


  PersonApiImpl(this._personProviderImpl);




  @override
  Future<DataCadete> getDataCadete(String cedula) async {
    try {


      return   await _personProviderImpl.getDataCadete( cedula);
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }
  }


}
