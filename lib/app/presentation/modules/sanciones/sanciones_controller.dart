part of '../controllers.dart';

class SancionesController extends GetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  DateTime dateFechaNow = DateTime.now();

  BuildContext ctxDialogoQr = Get.context!;




  RxString cedulaQr = ''.obs;
  RxString fechaActual = ''.obs;
  RxString fechaActualReal = ''.obs;

  var peticionServerState = false.obs;
  var selectCedula = true.obs;
  var selectNombres = false.obs;
  var showDatos = false.obs;

  Rx<CadeteModel> dataCedete = CadeteModel.empty().obs;

  var controllerCedula = TextEditingController();
  var controllerNombres = TextEditingController();
  var controllerObservacion = TextEditingController();

  final keyNombres = GlobalKey<FormState>();
  final keyCedula = GlobalKey<FormState>();
  final keyObservacion = GlobalKey<FormState>();

  RxList<ModelDataCombo> dataComboListSanciones = <ModelDataCombo>[].obs;
  Rx<ModelDataCombo> dataSelectSanciones =
      ModelDataCombo(id: 0, titulo: "").obs;




  final SancionesApiImpl _sancionesApiImpl = Get.find<SancionesApiImpl>();
  final PersonApiImpl _personApiImpl = Get.find<PersonApiImpl>();



  int idSubTipoOperativo = 0;

  final GlobalKey gLobalkey = GlobalKey();



  @override
  void onInit() {


    fechaActualReal.value = DateFormat(AppConfig.formatoFecha).format(dateFechaNow);


    setFecha(dateFechaNow);

    getSancionesLeves();

    super.onInit();
  }

  setFecha(dateFecha) {
    dateFechaNow = dateFecha;
    fechaActual.value = DateFormat(AppConfig.formatoFecha).format(dateFecha);



  }

  @override
  void onReady() {
    super.onReady();
  }

  getSancionesLeves() async {
    try {
      if(AppConfig.dataComboListSanciones.length>0){
        dataComboListSanciones=AppConfig.dataComboListSanciones;
        print("cargo de la lita");
        return;
      }


      peticionServerState(true);

      final List<SancionesModel> sanciones =
          await _sancionesApiImpl.getSancionesLeves();

      print("sanciones.length ${sanciones.length}");


      if (sanciones.length > 0 ) {
        print("cargo del server");
        dataComboListSanciones.clear();

        for (int i = 0; i < sanciones.length; i++) {
          SancionesModel x = sanciones[i];

          dataComboListSanciones.add(
            ModelDataCombo(id: x.id, titulo: "${x.name}. ${x.description}"),
          );
        }

        AppConfig.dataComboListSanciones=dataComboListSanciones;
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

            print("cerrando dialogo = ${result}");
            //Navigator.of(Get.context!).pop(AppConfig.dialogoQr);
            // Navigator.pop(ctxDialogoQr);


             //Navigator.of(AppConfig.ctxDialogoQr!).pop();
            if(AppConfig.dialogoShow) {
              Get.back();
              AppConfig.dialogoShow=false;
            }


          } else {
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

      CadeteModel dataCadete = await _personApiImpl.getDataCadete(cedula);
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

  registreSanctions() async {
    try {
      if (!keyObservacion.currentState!.validate()) {
        return;
      }

      if (dataSelectSanciones.value.id == 0) {
        DialogosAwesome.getWarning(descripcion: "Seleccione una sanción");
        return;
      }

      peticionServerState(true);
      FocusScope.of(Get.context!).requestFocus(new FocusNode());

      int estadoSancion = 33; //ejecutado
      estadoSancion=66; //registrado


      SanctionsRequest sanctionsRequest = SanctionsRequest(
          code: 1,
          missingDescription: controllerObservacion.text,
          instructor: AppConfig.user.userData.person_id,
          cadet: dataCedete.value.dataCadete.id,
          sectionPromotion: 1,
          score: 20,
          legalRegulation: dataSelectSanciones.value.id,
          dateSanction: fechaActual.value,
          dateRegistration: fechaActualReal.value,
          statusSanction: estadoSancion);

      String code = await _sancionesApiImpl.registreSanctions(sanctionsRequest);
      if (code.length>0) {

        DialogosAwesome.getSucess(
            descripcion: "Sanción registrada con éxito.\n\n Número de Sanción ${code}",
            isDismissible: false,
            btnOkOnPress: (){
              Get.offAllNamed(AppRoutes.SANCIONES);
            }
        );
      } else {
        DialogosAwesome.getWarning(descripcion: "No se completó el registro");
      }

      peticionServerState(false);
    } on ServerException catch (e) {
      peticionServerState(false);
      DialogosAwesome.getError(descripcion: e.cause);
    }
  }
}
