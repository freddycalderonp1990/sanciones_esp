part of '../../pages.dart';

class InicioRapidoPage extends GetView<InicioRapidoController> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    // TODO: verifique
/*

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _validateTieneFoto(context);
    });*/
    print('buildd');


    Widget wg = WorkAreaLoginPageWidget(
      title: "Escuela Superior de Policía",
     // imgPerfil:controller.loginController.user.value.foto.fotoBase64,
      mostrarVersion: true,
      imgFondo: AppImages.imgFondoLogin,
      peticionServer: controller.peticionServerState,
      sizeTittle: 7,
      contenido: <Widget>[getContenido(responsive)],
    );

    return GetBuilder<LoginController>(
      builder: (_c) => wg,
    );
  }

  Widget getContenido(ResponsiveUtil responsive) {
    return Column(
      children: [
       Obx(()=> Text(
         controller.user.value.userData.name,
         textAlign: TextAlign.center,
         style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.bold,
             fontSize: responsive.anchoP(5)),
       )),
        SizedBox(
          height: responsive.altoP(2),
        ),
        wgHuella(),
        SizedBox(
          height: responsive.altoP(1),
        ),

        wgOtroUsuario(responsive)
      ],
    );
  }

  Widget wgHuella() {
    Widget wg = DesingBtn(

        title: "HUELLA",
        img: AppImages.iconHuella,

        onTap: () => controller.loginConBiometrico());

    return  wg;
  }

  Widget wgOtroUsuario(ResponsiveUtil responsive) {
    Widget wg = DesingBtn(
        title: "¿NO ERES TÚ?",
        img: AppImages.iconUsuario,
        onTap: () async {
          DialogosAwesome.getWarningSiNo(
              descripcion:
              "Por su seguridad el acceso rapido sera desactivado."
                  "\n¿Desea Continuar?",
              btnOkOnPress: (){
                controller.ingresoConOtroUsuario();
              });
        });

    return wg;
  }

  Widget wgClaveDigital(ResponsiveUtil responsive) {
    Widget wg = DesingBtn(
        title: "Clave Digital",
        img: AppImages.iconClaveDigital,
        onTap: () async {
          DialogosDesingWidget.getDialogoXClaveTemporal(
              title: "Clave Temporal",
              contenido: Obx(() => Column(
                children: [
                  Center(
                    child: Text(
                      controller.codigo.value,
                      style: TextStyle(fontSize: responsive.diagonalP(5)),
                    ),
                  ),

                ],
              )),
              onPressedX: () {
                // controller.stopTimer();
                Get.back();
              });
        });

    return wg;
  }






}
