part of '../pages.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WorkAreaPageAppWidget(
        name: controller.loginController.user.value.userData.name,
        imgPerfil: AppImages.imgBase64,
        btnAtras: false,
        pantallaIrAtras: () {
          print(
            "object",
          );
          Get.offAllNamed(AppRoutes.HOME);
        },
        title: "MENÚ",
        peticionServer: controller.peticionServerState,
        contenido: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: getMenu())],
        ));
  }

  getMenu() {
    final responsive = ResponsiveUtil();
    Widget wg = Column(
      children: [
        Container(
          height: responsive.altoP(8),
        ),
        BotonesWidget(
            iconData: Icons.edit_square,
            title: "SANCIONES",
            onPressed: () {
              Get.toNamed(AppRoutes.SANCIONES);
            }),
      ],
    );

    return wg;
  }
}
