part of 'mods_impl.dart';

class PersonApiProviderModsImpl extends PersonRepository {



  @override
  Future<DataCadete> getDataCadete(String cedula) async {

    final String json = await rootBundle.loadString('assets/json/cadete.json');

    return cadeteModelFromJson(json).dataCadete;
  }



}
