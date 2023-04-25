part of '../../controllers.dart';

class ConsultaSancionesController extends GetxController {
  final SancionesApiImpl _sancionesApiImpl = Get.find<SancionesApiImpl>();

  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  RxBool peticionServer = false.obs;
  RxBool porIdEmpresa = false.obs;

  RxList<ConsultSanctionModel> listSanciones = <ConsultSanctionModel>[].obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxList<ConsultSanctionModel> lista = <ConsultSanctionModel>[].obs;

  final TextEditingController controllerId = TextEditingController();

  String fechaDesde = '';
  String fechaHasta = '';

  @override
  void onInit() {
    // TODO: el contolloler se ha creado pero la vista no se ha renderizado
    _loadDatos();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: Donde la vista ya se presento
  }

  _loadDatos() async {
    fechaDesde = MyDate.getFechaActual;
    fechaHasta = MyDate.getFechaActual;
    var data = Get.arguments;
    if (data != null) {
      int id = data['idEmpresa'];
      controllerId.text = id.toString();
      porIdEmpresa.value = true;
    }
  }

  void setFechaDesdeHasta(ModelFechaDesdeHasta dato) {
    fechaDesde = dato.fechaDesde;
    fechaHasta = dato.fechaHasta;


    print("desde= ${fechaDesde}  hasta= ${fechaHasta}");
  }

  Future<void> consultarConsultaSanciones() async {
    try {
      peticionServer(true);
      listSanciones.value = await _sancionesApiImpl.getSancionesPorFecha(
          fechaDesde: fechaDesde,
          fechaHasta: fechaHasta,
          idInstructor: AppConfig.user.userData.person_id);

      peticionServer(false);
    } on ServerException catch (e) {
      peticionServer(false);
      DialogosAwesome.getError(descripcion: e.cause, btnOkOnPress: () {});
    }
  }
}
