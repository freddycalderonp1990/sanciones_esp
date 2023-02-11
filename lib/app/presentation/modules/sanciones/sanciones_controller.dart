part of '../controllers.dart';

class SancionesController extends GetxController {
  var peticionServerState = false.obs;
  var selectCedula = true.obs;
  var selectNombres = false.obs;

  Rx<DataCadete> dataCedete = DataCadete.empty().obs;

  var controllerCedula = new TextEditingController();
  var controllerNombres = new TextEditingController();

  final keyNombres = GlobalKey<FormState>();
  final keyCedula = GlobalKey<FormState>();

  RxList<ModelDataCombo> dataCombo = <ModelDataCombo>[].obs;
  Rx<ModelDataCombo> dataSelect = ModelDataCombo(id: 0, titulo: "").obs;

  final loginController = Get.find<LoginController>();
  final SancionesApiImpl _sancionesApiImpl = Get.find<SancionesApiImpl>();
  final PersonApiImpl _personApiImpl = Get.find<PersonApiImpl>();

  AuthModel user = AuthModel.empty();

  int idSubTipoOperativo = 0;

  final LocalStorageRepository _localStorageRepository =
      Get.find<LocalStorageRepository>();

  @override
  void onInit() {
    getSancionesLeves();

    super.onInit();
  }

  @override
  void onReady() {
    user = loginController.user.value;

    super.onReady();
  }

  getSancionesLeves() async {
    try {
      peticionServerState(true);

      final List<Sancion> sanciones =
          await _sancionesApiImpl.getSancionesLeves();

      print("sanciones.length ${sanciones.length}");

      if (sanciones.length > 0) {
        dataCombo.clear();

        for (int i = 0; i < sanciones.length; i++) {
          Sancion x = sanciones[i];

          dataCombo.add(
            ModelDataCombo(id: x.id, titulo: "${x.name}. ${x.description}"),
          );
        }
      }
      peticionServerState(false);
    } on ServerException catch (e) {
      peticionServerState(false);
      DialogosAwesome.getError(descripcion: e.cause);
    }
  }




  getDataCadetePorCedula({required String cedula}) async {
    try {

      if(!keyCedula.currentState!.validate()){
        return;
      }


      peticionServerState(true);

      List<DataCadete> listCadete = await _personApiImpl.getDataCadete(cedula);
      if (listCadete.length == 0) {
        DialogosAwesome.getInformationAceptar(

            descripcion: "No se encontro datos con la cédula ingresada");
        peticionServerState(false);
        return;
      }

      dataCedete.value = listCadete[0];

      peticionServerState(false);
    } on ServerException catch (e) {
      peticionServerState(false);
      DialogosAwesome.getError(descripcion: e.cause);
    }
  }
}
