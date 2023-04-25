import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../data/models/models.dart';
import '../presentation/modules/controllers.dart';
import '../presentation/widgets/custom_app_widgets.dart';
import 'values/app_images.dart';

enum Ambiente { desarrollo, prueba, produccion }


class AppConfig {
 static String nameApp="Sanciones";
 static const String  PASWORD_APP = "8f6f5a20219269a83aa455cd51a791c9b92e57b9ada060b929994433e4818d6f";

  static const AmbienteUrl = Ambiente.produccion;


  static const String linkAppAndroid =
      "https://play.google.com/store/apps/details?id=underpro.ecuador.pagme_underpro";
  static const String linkAppIos =
      "";


  static  String formatoFecha =  'yyyy-MM-dd';
  static  String formatoHora =  'HH:mm';

  static const double radioBotones = 10.0;

  static const double radioBordecajas = 10.0;
  static const double sobraBordecajas = 7.0;

  static const double tamTextoTituloGrande = 6; //tamaño del texto en porcentaje
  static const double tamTextoTitulo = 2; //tamaño del texto en porcentaje
  static const double tamTexto = 1.5; //tamaño del texto en porcentaje

  static const double anchoContenedor = 90.0;



  static  int intentosFallidos =   3;


 static RxList<ModelDataCombo> dataComboListSanciones = <ModelDataCombo>[].obs;

 static AuthModel user = AuthModel.empty();

 static bool dialogoShow=false;

}
