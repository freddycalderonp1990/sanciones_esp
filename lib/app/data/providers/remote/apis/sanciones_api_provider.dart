part of '../../providers_impl.dart';


class SancionesApiProviderImpl extends SancionesRepository {


  @override
  Future<List<SancionesModel>> getSanciones(int parentId) async {

    String json = await UrlApiProvider.get(
        segmento: 'catalogs?parentId=${parentId}');

    return sancionesModelFromJson(json);
  }

  @override
  Future<String> registreSanctions(SanctionsRequest sanctionsRequest) async {
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
    String jsonString = await UrlApiProvider.post(
        body: body, segmento: 'sanctions');

    Map<String, dynamic> jsonData=json.decode(jsonString);

    String code=ParseModel.parseToString(jsonData["code"]);

    return code;




  }

  @override
  Future<List<ConsultSanctionModel>> getSancionesPorFecha({required String fechaDesde,required String fechaHasta,required int idInstructor}) async{
    String json = await UrlApiProvider.get(
        segmento: 'sanctions?dateSanction__gte=${fechaDesde}&dateSanction__lte=${fechaHasta}&&instructor__person=${idInstructor}');

    return consultSanctionModelFromJson(json);
  }



}
