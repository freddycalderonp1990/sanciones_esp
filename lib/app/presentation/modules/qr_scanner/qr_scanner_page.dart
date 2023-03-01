part of '../pages.dart';


class QrScannerPage extends GetView<QrScannerController> {
  QrScannerPage({Key? key}) : super(key: key);

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

    BtnIconWidget(onPressed: (){}),

          Text('SANCIÓN DISCIPLINARIA LEVE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: responsive.diagonalP(AppConfig.tamTexto + 0.5),
              )),


        ],
      ),
    );

    return wg;
  }

}
