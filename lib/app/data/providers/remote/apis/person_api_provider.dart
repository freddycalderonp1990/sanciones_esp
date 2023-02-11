part of '../../providers_impl.dart';


class PersonApiProviderImpl extends PersonRepository {



  @override
  Future<List<DataCadete>> getDataCadete(String cedula) async {

    String json = await UrlApiProvider.get(
        segmento: 'cadets?person__dni=${cedula}');


    return cadeteModelFromJson(json).dataCadete;
  }



}
