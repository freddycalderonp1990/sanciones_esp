part of '../pages.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WorkAreaPageAppWidget(
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
          children: [

            Expanded(child: getMenu())
          ],
        ));
  }

  getMenu() {
    final responsive = ResponsiveUtil();
    Widget wg = Column(children: [

      Container(height:responsive.altoP(8) ,),
      BotonesWidget(
        iconData: Icons.add_box_rounded,
          title: "SANCIONES",onPressed: (){

        Get.toNamed(AppRoutes.SANCIONES);
      }),

      BotonesWidget(
        padding: EdgeInsets.only(top: 10),
          iconData: Icons.close,
          title: "SALIR",onPressed: (){

        Get.offAllNamed(AppRoutes.SPLASH);
      }),


    ],);

    return wg;
  }
}
