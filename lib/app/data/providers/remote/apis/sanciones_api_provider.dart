part of '../../providers_impl.dart';


class SancionesApiProviderImpl extends SancionesRepository {


  @override
  Future<List<Sancion>> getSanciones(int parentId) async {


    String json = await UrlApiProvider.get(
        segmento: 'catalogs?parentId=${parentId}');

    return sancionesModelFromJson(json).sancion;
  }



}
