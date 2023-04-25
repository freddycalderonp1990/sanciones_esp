part of 'mods_impl.dart';

class SancionesApiProviderModsImpl extends SancionesRepository {


  @override
  Future<List<SancionesModel>> getSanciones(int parentId) async {

    final String json = await rootBundle.loadString('assets/json/sanciones.json');


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
    final String json = await rootBundle.loadString('assets/json/registre_sanciones.json');





    CabeceraModel cabeceraRequest=  cabeceraModelFromJson(json);
    print(cabeceraRequest.message);
    print(cabeceraRequest.statusCode);

    if(cabeceraRequest.statusCode==200 && cabeceraRequest.message=="Creado con éxito" ){
      return '1';
    }
    else{
      return '';
    }


  }

  @override
  Future<List<ConsultSanctionModel>> getSancionesPorFecha({required String fechaDesde, required String fechaHasta, required int idInstructor}) {
    // TODO: implement getSancionesPorFecha
    throw UnimplementedError();
  }



}
