part of '../../providers_impl.dart';


class SancionesApiProviderImpl extends SancionesRepository {


  @override
  Future<List<Sancion>> getSanciones(int parentId) async {

    String json = await UrlApiProvider.get(
        segmento: 'catalogs?parentId=${parentId}');

    return sancionesModelFromJson(json).sancion;
  }

  @override
  Future<bool> registreSanctions(SanctionsRequest sanctionsRequest) async {
    Object? body = {
      "code": sanctionsRequest.code,
      "missingDescription": sanctionsRequest.missingDescription,
      "dateSanction":sanctionsRequest.dateSanction,
      "dateRegistration":sanctionsRequest.dateRegistration,
      "instructor":sanctionsRequest.instructor,
      "cadet":sanctionsRequest.cadet,
      "sectionPromotion":sanctionsRequest.sectionPromotion,
      "legalRegulation":sanctionsRequest.legalRegulation,
      "score":sanctionsRequest.score,
      "statusSanction":sanctionsRequest.statusSanction
    };
    String json = await UrlApiProvider.post(
        body: body, segmento: 'sanctions');


    CabeceraModel cabeceraRequest=  cabeceraModelFromJson(json);
    print(cabeceraRequest.message);
    print(cabeceraRequest.statusCode);

    if(cabeceraRequest.statusCode==200 && cabeceraRequest.message=="Creado con éxito" ){
      return true;
    }
    else{
      return false;
    }


  }



}
