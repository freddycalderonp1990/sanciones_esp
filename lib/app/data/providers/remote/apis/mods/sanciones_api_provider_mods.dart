part of 'mods_impl.dart';

class SancionesApiProviderModsImpl extends SancionesRepository {


  @override
  Future<List<Sancion>> getSanciones(int parentId) async {

    final String json = await rootBundle.loadString('assets/json/sanciones.json');


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
    final String json = await rootBundle.loadString('assets/json/registre_sanciones.json');



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
