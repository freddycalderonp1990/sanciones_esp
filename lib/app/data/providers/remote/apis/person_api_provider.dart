part of '../../providers_impl.dart';


class PersonApiProviderImpl extends PersonRepository {



  @override
  Future<CadeteModel> getDataCadete(String cedula) async {

    String json = await UrlApiProvider.get(
        segmento: 'cadets/search-dni/${cedula}');


    return cadeteModelFromJson(json);
  }



}
