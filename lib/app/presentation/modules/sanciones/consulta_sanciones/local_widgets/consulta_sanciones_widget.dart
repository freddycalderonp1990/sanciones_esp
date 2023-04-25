import 'package:flutter/material.dart';

import '../../../../../core/app_config.dart';
import '../../../../../core/utils/responsiveUtil.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_images.dart';
import '../../../../widgets/custom_app_widgets.dart';

class ConsultaSancionesWidget extends StatelessWidget {
  const ConsultaSancionesWidget(
      {Key? key,
      required this.cadete,
      required this.codigo,
      required this.descripcion,
      required this.indice,
      required this.fechaRegistro,
      required this.fechaSancion, required this.statusSanction})
      : super(key: key);

  final int indice;
  final String codigo;
  final String cadete;
  final String fechaRegistro;
  final String fechaSancion;
  final String descripcion;
  final String statusSanction;

  @override
  Widget build(BuildContext context) {
    return wg();
  }

  Widget wg() {
    final responsive = ResponsiveUtil();
    return Material(
        borderRadius: BorderRadius.circular(AppConfig.radioBotones),
        child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(AppConfig.radioBotones),
            child: Container(
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: AppColors.colorContenedores,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: AppColors.colorBordecajas, blurRadius: 1)
                  ]),
              child: Column(
                children: [
                  TituloTextWidget(
                    title: "CÓDIGO: ${codigo} - (${statusSanction})",
                    letterSpacing: 1,
                  ),
                  TituloTextWidget(
                    title: "CADETE: ${cadete}",
                    letterSpacing: 0,
                  ),
                  Row(
                    children: [
                      Text(
                          indice < 10
                              ? "0" + indice.toString()
                              : indice.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: responsive
                                  .diagonalP(AppConfig.tamTextoTitulo + 0.5))),
                      Expanded(
                        flex: 1,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconDetalleWidget(
                                    nameStringImg: AppImages.iconFecha,
                                    detalle:
                                        "Fecha Registro: ${fechaRegistro}"),
                                IconDetalleWidget(
                                    nameStringImg: AppImages.iconFecha,
                                    detalle: "Fecha Sanción: ${fechaSancion}"),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Text(descripcion,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize:
                                responsive.diagonalP(AppConfig.tamTexto))),
                  )
                ],
              ),
            )));
  }
}
