import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/core/values/app_images.dart';
import '../../../../../app/core/values/app_strings.dart';
import '../../../../../app/core/values/app_colors.dart';
import '../../../../../app/presentation/widgets/custom_app_widgets.dart';
import '../../../../../app/core/app_config.dart';
import '../../../../../app/core/utils/responsiveUtil.dart';

import '../../controllers.dart';

class WgLogin extends StatefulWidget {
  final controllerUser;

  final controllerPass;

  final VoidCallback? onPressed;
  final formKey;
  final double ancho;
  final bool mostrarFondo;

  const WgLogin(
      {Key? key,
      this.controllerUser,
      this.controllerPass,
      this.onPressed,
      this.formKey,
      this.ancho = 50.0,
      this.mostrarFondo = false})
      : super(key: key);

  @override
  _WgLoginState createState() => _WgLoginState();
}

class _WgLoginState extends State<WgLogin> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtil();
    final sizeTxt = responsive.diagonalP(AppConfig.tamTexto );

    Widget desing = Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.ancho! - widget.ancho,
            minWidth: responsive.ancho! - widget.ancho,
          ),
          child: Form(
              key: widget.formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, //PARA PROBAR CONTAINER
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: ImputTextWidget(

                      imgString: AppImages.iconUsuario,
                      controller: widget.controllerUser,
                      elevation: 1,
                      label: "Usuario",
                      fonSize: sizeTxt,
                      hitText: "Ingrese el usuario",
                      validar: (text) {
                        if (text!.length >= 1) {
                          return null;
                        }
                        return "Usuario no valido";
                      },
                    ),
                  ),
                  SizedBox(
                    height: responsive.altoP(2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, //PARA PROBAR CONTAINER
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: ImputTextWidget(
                      imgString: AppImages.iconClave,
                      elevation: 1,
                      isSegura: true,
                      controller: widget.controllerPass,
                      hitText: "Ingrese la clave",
                      label: "Clave",
                      fonSize: sizeTxt,
                      validar: (text) {
                        if (text.toString().length >= 1) {
                          return null;
                        }
                        return "Clave no valida";
                      },
                    ),
                  )
                ],
              )),
        ),
        SizedBox(
          height: responsive.altoP(4),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: responsive.ancho! - 80,
            minWidth: responsive.ancho! - 80,
          ),
          child: BotonesWidget(
            iconData: Icons.arrow_forward,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            title: "INGRESAR",

            onPressed: widget.onPressed,
          ),
        ),
      ],
    );

    Widget wg = widget.mostrarFondo
        ? Stack(
            children: [
              Container(
                height: responsive.alto! / 2,
                width: responsive.ancho! - 100,
                child: Image.asset(
                  AppImages.imgFondoLogin,
                  fit: BoxFit.cover,
                ),
              ),
              desing
            ],
          )
        : desing;

    return GetBuilder<LoginController>(
        id: 'WgLogin',
        builder: (_) => _.wgLoginUserPass.value ? wg : Container());
  }
}
