part of '../../data_repositories.dart';

class PersonApiImpl extends PersonRepository {
  final  _personProviderImpl;


  PersonApiImpl(this._personProviderImpl);




  @override
  Future<CadeteModel> getDataCadete(String cedula) async {


      return   await _personProviderImpl.getDataCadete( cedula);

  }


}
