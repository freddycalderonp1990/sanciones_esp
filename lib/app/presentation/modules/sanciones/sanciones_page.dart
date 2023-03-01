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
    Widget wg = SingleChildScrollView(
      child: Column(
        children: [
          /* BtnIconWidget(
              titulo: "Qr",
              onPressed: () {
                DialogosDesingWidget.getDialogoX(
                    title: "Qr",
                    contenido: Container(
                      height: 400,
                      width: 400,
                      child: QRView(
                        key: controller.qrKey,
                        onQRViewCreated: controller.onQRViewCreated,
                        overlay: QrScannerOverlayShape(
                            borderColor: Colors.red,
                            borderRadius: 10,
                            borderLength: 30,
                            borderWidth: 10,
                            cutOutSize: responsive.diagonalP(25)),
                        onPermissionSet: (ctrl, p) =>
                            controller.onPermissionSet(Get.context!, ctrl, p),
                      ),
                    ));
              }),

              */
          Obx(
            () => Text(controller.cedulaQr.value),
          ),
          Text('SANCIÓN DISCIPLINARIA LEVE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: responsive.diagonalP(AppConfig.tamTexto + 0.5),
              )),
          Container(
            height: responsive.diagonalP(8),
            child: Image.asset(AppImages.img_bandera_escudo_esp),
          ),
          getTipoDeConsulta(),
          Obx(() => getWgImputTipoBusqueda()),
          SizedBox(
            height: 5,
          ),
          Obx(() => controller.showDatos.value
              ? getWgDatosHideShowSanciones()
              : Container())
        ],
      ),
    );

    return wg;
  }

  getWgDatosHideShowSanciones() {
    final responsive = ResponsiveUtil();
    return Column(
      children: [
        getWdDatos(),
        SizedBox(
          height: 5,
        ),
        getWdSanciones(),
        ContenedorDesingWidget(
          margin: const EdgeInsets.all(8.0),
          child: Form(
              key: controller.keyObservacion,
              child: TextFormField(
                validator: (value) {
                  if (value.toString().length == 0) {
                    return "Ingrese la observación";
                  }
                },
                controller: controller.controllerObservacion,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            responsive.diagonalP(AppConfig.tamTexto + 0.5),
                        color: AppColors.colorAzulSecond),
                    labelText: "Observación",
                    hintText: "Escriba....",
                    alignLabelWithHint: false,
                    filled: true),
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                textInputAction: TextInputAction.done,
              )),
        ),
        Container(
          height: responsive.altoP(2),
        ),
        BotonesWidget(
            iconData: Icons.save,
            title: "REGISTRAR",
            onPressed: () => controller.registreSanctions()),
      ],
    );
  }

  getTipoDeConsulta() {
    return Container();
    final responsive = ResponsiveUtil();
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: BtnIconWidget(
                  onPressed: () {
                    controller.selectCedula.value = true;
                    controller.selectNombres.value = false;
                  },
                ),
              ),
              SizedBox(
                width: responsive.diagonalP(0.5),
              ),
              /* Expanded(
                  child: BtnIconWidget(
                select: controller.selectNombres.value,
                stringImg: AppImages.iconUsuario,
                titulo: "Nombres",
                onPressed: () {
                  controller.selectCedula.value = false;
                  controller.selectNombres.value = true;
                },
              )),*/
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

    Widget wgFoto = Container();

    String fotoBase64 = controller.dataCedete.value.image;

    Uint8List? imgMemory = PhotoHelper.convertStringToUint8List(fotoBase64);
    if (imgMemory != null) {
      Widget onlyWdFoto = ClipRRect(
          borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
          child: Image.memory(
            imgMemory,
            fit: BoxFit.fill,
          ));

      wgFoto = MaterialButton(
          onPressed: () {
            DialogosDesingWidget.getDialogoX(
                contenido: onlyWdFoto,
                title: controller.dataCedete.value.person.namesComplete);
          },
          child: Container(
            height: responsive.altoP(15),
            width: responsive.altoP(15),
            child: onlyWdFoto,
          ));
    }

    double separacionText = 5;

    Widget wg = ContenedorDesingWidget(
        paddin: EdgeInsets.all(5),
        anchoPorce: 95,
        child: Obx(() => Column(
              children: [
                wgFoto,
                IconTitleDetalleWidget(
                    icon: Icons.business,
                    detalle: controller.dataCedete.value.promotion,
                    title: "COMPAÑIA:"),
                SizedBox(
                  height: separacionText,
                ),
                IconTitleDetalleWidget(
                    icon: Icons.assignment_ind,
                    detalle: controller.dataCedete.value.person.namesComplete,
                    title: "NOMBRES:"),
                SizedBox(
                  height: separacionText,
                ),
                IconTitleDetalleWidget(
                    icon: Icons.beenhere,
                    detalle: controller.dataCedete.value.section,
                    title: "SECCIÓN:"),
                SizedBox(
                  height: separacionText,
                ),
                Row(
                  children: [
                    Flexible(
                      child: IconTitleDetalleWidget(
                          icon: Icons.date_range,
                          detalle: controller.fechaActual.value,
                          title: "FECHA SANCIÓN:"),
                    ),
                    BtnIconWidget(
                      onPressed: () {

                        print("holaa");
                        showDialogoFechaHoraWidget(Get.context!,
                            initialDate: controller.dateFechaNow,
                            mostrarHora: true, onSelectedDate: (selectedDate) {
                          controller.setFecha(selectedDate);
                        });
                      },
                      icon: Icons.date_range_outlined,
                    )
                  ],
                )
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
          selectValue: controller.dataSelectSanciones,
          data: controller.dataCombo.value,
          complete: (data) {
            controller.dataSelectSanciones.value = data;
            print("daaaa");
          })),
    );

    return wg;
  }
}
