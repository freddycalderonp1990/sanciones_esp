import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../data/models/models.dart';
import '../presentation/modules/controllers.dart';
import 'values/app_images.dart';

enum Ambiente { desarrollo, prueba, produccion }


class AppConfig {
 static String nameApp="Sanciones";
 static const String  PASWORD_APP = "8f6f5a20219269a83aa455cd51a791c9b92e57b9ada060b929994433e4818d6f";

  static const AmbienteUrl = Ambiente.desarrollo;


  static const String linkAppAndroid =
      "https://play.google.com/store/apps/details?id=underpro.ecuador.pagme_underpro";
  static const String linkAppIos =
      "";
 static AuthModel  user = AuthModel.empty();

  static  String formatoFecha =  'yyyy-MM-dd';
  static  String formatoHora =  'HH:mm';

  static const double radioBotones = 10.0;

  static const double radioBordecajas = 10.0;
  static const double sobraBordecajas = 7.0;

  static const double tamTextoTituloGrande = 6; //tamaño del texto en porcentaje
  static const double tamTextoTitulo = 2; //tamaño del texto en porcentaje
  static const double tamTexto = 1.5; //tamaño del texto en porcentaje

  static const double anchoContenedor = 90.0;
  static const int diasMostarAletrta = 1;// dias minismo que muestra la alerta cuando la app esta por vencer


  static const double letterSpacing=2.0;


  static double porcentaje=12.0;
  static int plazoDias=30;


  static List<String> diasPermitidos=['Lunes','Martes','Miércoles','Jueves','Viernes','Sábado'];
  static List<String> tiposPrestamos=["Diario","Semanal","Quinsenal","Mensual"];


  static  int intentosFallidos =   3;



  //esta variable conmfigura el tiempo en el que usaurio puede volvr a ver anuncios para ganar dias
  static int minutosGanarDias=10;
  static int minutosParaMostrarAnuncioIntertitial=1;
  //cantidad de anuncios que el usaurio debe visualizar para ganar dias
  static int cantAnuncios=5;

 static bool mostrarAnuncios=false;
}
