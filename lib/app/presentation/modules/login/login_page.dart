part of '../pages.dart';

class LoginPage extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();

  var controllerUser = new TextEditingController();
  var controllerPass = new TextEditingController();

  void login({bool validarForm = true}) async {
    var isValid = true;

    if (validarForm) {
      isValid = _formKey.currentState!.validate();
    }

    if (isValid) {
      await controller.login();

    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    Widget wg = Obx(() => WorkAreaLoginPageWidget(
          mostrarVersion: true,
          imgFondo: AppImages.imgFondoLogin,
          peticionServer: controller.peticionServerState,
          title: 'ESCUELA SUPERIOR DE POLICÍA \n«Gral. Alberto Enrríquez Gallo»',
          sizeTittle: 6,
          contenido: <Widget>[
            SizedBox(
              height: responsive.altoP(3),
            ),
            Column(
              children: <Widget>[
                controller.wgLoginUserPass.value
                    ? WgLogin(
                        onPressed: () => login(),
                        controllerPass: controller.controllerPass,
                        controllerUser: controller.controllerUser,
                        formKey: _formKey,
                      )
                    : Container(),

                SizedBox(
                  height: responsive.altoP(3.5),
                ),
              ],
            )
          ],
        ));



    return GetBuilder<LoginController>(
      builder: (_c) => wg,
    );
  }


}
