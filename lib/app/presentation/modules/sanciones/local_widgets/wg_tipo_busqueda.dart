import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_config.dart';
import '../../../../core/utils/responsiveUtil.dart';
import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_images.dart';
import '../../../widgets/custom_app_widgets.dart';


class WgTipoBusqueda extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String title;
  final String msjError;
  final GlobalKey<FormState> myKey;
  final int maxLength;
  final TextInputType keyboardType;
  final Icon? icono;
  final double anchoPorcentaje;
  final TextEditingController controller;

  const WgTipoBusqueda({ this.onTap,required this.title,required this.msjError,required this.myKey, this.maxLength=11, this.keyboardType=TextInputType.text, this.icono, this.anchoPorcentaje=100, required this.controller}) ;

  @override
  Widget build(BuildContext context) {


    final responsive = ResponsiveUtil();
    return Container(

        padding: EdgeInsets.only(bottom: 2,top: 0),
        width: responsive.anchoP(anchoPorcentaje),
        decoration: BoxDecoration(
          color: AppColors.colorContenedores,
          borderRadius: BorderRadius.circular(AppConfig.radioBordecajas),
          border: Border.all(color: Colors.white.withOpacity(0.8), width: 0.5),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 0.0, right: 20.0),


          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: responsive.altoP(1),
              ),
              Expanded(
                  child: Form(
                    key: myKey,
                    child: ImputTextWidget(
                      controller: controller,
                      keyboardType: keyboardType,
                      maxLength: maxLength,
                      icono: icono,
                      activar: true,
                      colorLabel: Colors.white,
                      label: title,
                      fonSize: responsive.diagonalP(2),
                      validar: (value) {
                        if (value.toString().length == 0 || value.toString().length<10) {
                          return msjError;
                        }
                      },
                    ),
                  )),
              SizedBox(
                width: responsive.altoP(1),
              ),
              BtnIconWidget(



                onPressed: onTap,
                  icon:Icons.search
              ),
            ],
          ),
        ));
  }
}
