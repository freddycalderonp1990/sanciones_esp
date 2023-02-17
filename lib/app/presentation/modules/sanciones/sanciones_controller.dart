part of '../controllers.dart';

class SancionesController extends GetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  BuildContext ctxDialogoQr=Get.context!;

  RxString cedulaQr = ''.obs;

  var peticionServerState = false.obs;
  var selectCedula = true.obs;
  var selectNombres = false.obs;
  var showDatos = false.obs;

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

  final GlobalKey gLobalkey = GlobalKey();

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

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      result = scanData;

      print("onQRViewCreated = ${result}");

      cedulaQr.value = '';
      if (result != null) {
        print("onQRViewCreated1 = ${result}");
        if (result!.code != null) {
          print("onQRViewCreated2 = ${result}");
          String cedula = result!.code!;

          Pattern pattern = r'^(?:[+0][1-9])?[0-9]{8,12}$';
          RegExp regExp = new RegExp(r'^(?:[+0][1-9])?[0-9]{8,12}$');

          bool resul = regExp.hasMatch(cedula);

          if (resul) {
            controllerCedula.text = cedula;
           // Navigator.pop(ctxDialogoQr);


            Navigator.of(Get.context!).pop();
          }
          else{
          //  DialogosAwesome.getError(descripcion: "Qr, No Valido");
          }
        }
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void qr(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((event) {
      print("yaaaaaaaaaaaaaaaaa");

      result = event;
    });
  }

  getDataCadetePorCedula({required String cedula}) async {
    try {
      if (!keyCedula.currentState!.validate()) {
        return;
      }

      peticionServerState(true);
      FocusScope.of(Get.context!).requestFocus(new FocusNode());

      DataCadete dataCadete = await _personApiImpl.getDataCadete(cedula);
      if (dataCadete == null) {
        DialogosAwesome.getInformationAceptar(
            descripcion: "No se encontro datos con la cédula ingresada");
        peticionServerState(false);
        return;
      }

      dataCedete.value = dataCadete;

      showDatos.value = true;

      peticionServerState(false);
    } on ServerException catch (e) {
      showDatos.value = false;
      peticionServerState(false);
      DialogosAwesome.getError(descripcion: e.cause);
    }
  }
}
