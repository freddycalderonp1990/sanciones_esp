part of '../../pages.dart';

class ConsultaSancionesPage extends GetView<ConsultaSancionesController> {
  const ConsultaSancionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WorkAreaPageAppWidget(
        btnAtras: true,
        title: "ACTIVIDAD - (${controller.lista.length})",
        peticionServer: controller.peticionServer,
        contenido: getContenido()));
  }

  Widget getContenido() {
    return Column(children: [
      periodo(),
      SizedBox(
        height: 5,
      ),
      Obx(
        () => Row(
          children: [
            controller.porIdEmpresa.value
                ? Flexible(
                    child: Form(
                      key: controller.formKey,
                      child: ImputTextWidget(
                        imgString: AppImages.iconBuscar,
                        controller: controller.controllerId,
                        elevation: 1,
                        label: "Empresa",
                        hitText: "Ingrese el Id",
                        validar: (text) {
                          if (text!.length >= 1) {
                            return null;
                          }
                          return "Ingresa el id";
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      BotonesWidget(
          iconData: Icons.search,
          title: "Buscar",
          onPressed: () => controller.consultarConsultaSanciones()),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 1,
        color: AppColors.colorAzulSecond,
      ),
      Expanded(child: getContenidoData())
    ]);
  }

  Widget periodo() {
    return PeriodoWidget(
      onSelectedDate: (ModelFechaDesdeHasta dato) {
        controller.setFechaDesdeHasta(dato);
      },
    );
  }

  Widget getContenidoData() {



    return Obx(()=>ListView.builder(
        itemCount: controller.listSanciones.value.length,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          ConsultSanctionModel data = controller.listSanciones[i];
          return ConsultaSancionesWidget(
            indice: i+1,
            cadete: data.cadet.person.names,
            codigo: data.code,
            fechaRegistro: data.dateRegistration,
            fechaSancion: data.dateSanction,
            descripcion: data.missingDescription,
            statusSanction: data.statusSanction.name,
          );
        }));
  }
}
