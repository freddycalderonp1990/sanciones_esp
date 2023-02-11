part of '../pages.dart';

class SancionesPage extends GetView<SancionesController> {
  SancionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WorkAreaPageAppWidget(
        btnAtras: true,
        peticionServer: controller.peticionServerState,
        contenido: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: getMenu())],
        ));
  }

  getMenu() {
    final responsive = ResponsiveUtil();
    Widget wg = SingleChildScrollView(child: Column(
      children: [
        Text('SANCIÓN DISCIPLINARIA LEVE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: responsive.diagonalP(AppConfig.tamTexto + 0.5),
            )),
        getTipoDeConsulta(),
        Obx(() => getWgImputTipoBusqueda()),
        SizedBox(
          height: 5,
        ),
        getWdDatos(),
        SizedBox(
          height: 5,
        ),
        getWdSanciones(),
        Container(
          height: responsive.altoP(8),
        ),
        BotonesWidget(iconData: Icons.save, title: "GUARDAR", onPressed: () {}),
      ],
    ),);

    return wg;
  }

  getTipoDeConsulta() {
    final responsive = ResponsiveUtil();
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: BtnIconWidget(
                  select: controller.selectCedula.value,
                  stringImg: AppImages.iconNumero,
                  titulo: "Cédula",
                  onPressed: () {
                    controller.selectCedula.value = true;
                    controller.selectNombres.value = false;
                  },
                ),
              ),
              SizedBox(
                width: responsive.diagonalP(0.5),
              ),
              Expanded(
                  child: BtnIconWidget(
                select: controller.selectNombres.value,
                stringImg: AppImages.iconUsuario,
                titulo: "Nombres",
                onPressed: () {
                  controller.selectCedula.value = false;
                  controller.selectNombres.value = true;
                },
              )),
            ],
          ),
        ));
  }

  getWgImputTipoBusqueda() {
    Widget wg = Container();

    //Nombres
    wg = WgTipoBusqueda(
        controller: controller.controllerNombres,
        myKey: controller.keyNombres,
        anchoPorcentaje: 95,
        title: "Apellidos y Nombres",
        msjError: "Ingrese un nombre valido",
        icono: Icon(
          Icons.document_scanner_sharp,
          color: AppColors.colorBotones,
        ),
        maxLength: 200,
        keyboardType: TextInputType.text,
        onTap: () {});

    //Cédula
    if (controller.selectCedula.value) {
      wg = WgTipoBusqueda(
        anchoPorcentaje: 95,
        myKey: controller.keyCedula,
        controller: controller.controllerCedula,
        maxLength: 10,
        icono: Icon(
          Icons.person_outline_outlined,
          color: AppColors.colorBotones,
        ),
        keyboardType: TextInputType.number,
        title: "Cédula",
        msjError: "Ingrese una cédula valida",
        onTap: () {
          controller.getDataCadetePorCedula(
              cedula: controller.controllerCedula.text);
        },
      );
    }

    return wg;
  }

  getWdDatos() {
    double radius = AppConfig.radioBordecajas;
    final responsive = ResponsiveUtil();

    Widget wg = Container();

    double separacionText = 5;
    Color colorTexto = Colors.black;
    wg = ContenedorDesingWidget(
        paddin: EdgeInsets.all(5),
        anchoPorce: 95,
        child: Obx(() => Column(
              children: [
                IconTitleDetalleWidget(
                    colorTexto: colorTexto,
                    nameStringImg: AppImages.iconUsuario,
                    detalle: controller.dataCedete.value.promotion,
                    title: "COMPAÑIA:"),
                SizedBox(
                  height: separacionText,
                ),
                IconTitleDetalleWidget(
                    colorTexto: colorTexto,
                    nameStringImg: AppImages.iconUsuario,
                    detalle: controller.dataCedete.value.person.names +
                        " " +
                        controller.dataCedete.value.person.lastName +
                        " " +
                        controller.dataCedete.value.person.secondName,
                    title: "NOMBRES:"),
                SizedBox(
                  height: separacionText,
                ),
                IconTitleDetalleWidget(
                    colorTexto: colorTexto,
                    nameStringImg: AppImages.iconUsuario,
                    detalle: "F",
                    title: "SECCIÓN:"),
              ],
            )));

    return wg;
  }

  getWdSanciones() {
    Widget wg = ContenedorDesingWidget(
      paddin: EdgeInsets.all(5),
      anchoPorce: 95,
      child: Obx(() => ComboConBusqueda(
          title: "Sanciónes Leves Art. 39",
          titleSelecioneEl: "Seleccione el literal",
          selectValue: controller.dataSelect,
          data: controller.dataCombo.value,
          complete: (data) {
            controller.dataSelect.value = data;
            print("daaaa");
          })),
    );

    return wg;
  }
}
