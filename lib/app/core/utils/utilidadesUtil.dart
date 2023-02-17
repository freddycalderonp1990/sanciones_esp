
import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../data/models/models.dart';
import '../../data/providers/providers_impl.dart';
import '../../presentation/widgets/custom_app_widgets.dart';
import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:network_info_plus/network_info_plus.dart';

class UtilidadesUtil {
  static bool plataformaIsAndroid() {
    return GetPlatform.isAndroid;
  }

  static  getVersionCodeNameApp() {
    return '';
  }

  static getVersionCode(){

  }


  static  convertUTF8(List<int> codeUnits){

    //Acepta los acentos y Ñ
    //Convierte a UTF-8
    String stringResponse = const Utf8Decoder().convert(codeUnits);


    return stringResponse;
  }

  static  double cacularPorcentaje({required double valor ,required double totalMonto}){
    double subtotal=valor/totalMonto;
    double total= subtotal*100;

    return total;
    return redondearDouble(total);
  }





  static abrirUrl(String url) async {
    try {
      url=url.trim();

      //print("url: ${url}");
      await launch(url);
    } catch (e) {
      DialogosAwesome.getWarning(
          descripcion: "No se pudo cargar la página");
    }
  }

  static compartirPdf(String archivo) async {
    try {



      await Share.shareFiles([archivo], text: 'Your PDF!');;
    } catch (e) {
      DialogosAwesome.getWarning(
          descripcion: "No se pudo cargar la página");
    }
  }







  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static enviarEmail(String texto) async {
    try {
      final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'freddycalderon1990@gmail.com',
        query: encodeQueryParameters(<String, String>{
          'subject': "Appmovil Pagme Información",
          'body': texto,
        }),
      );

      launch(_emailLaunchUri.toString());
    } catch (e) {
      DialogosAwesome.getWarning(
          descripcion: "No se pudo enviar el email");
    }
  }

  static double redondearDouble(double value,{int decimales=4}){

    String r= value.toStringAsFixed(decimales);

    return double.parse(r);

  }



  static enviarWts(String texto) async {

    String uri_Wts="https://api.whatsapp.com/send?phone=+593988500896&text="+texto;
     abrirUrl(uri_Wts);

  }


  static Future<void> lanzarLlamada(String num) async {
    try {
      launch(
          'tel://$num'); //donde $phoneNumber es el numero de teléfono que queremos marcar
    } catch (e) {
      DialogosAwesome.getWarning(
          descripcion: "No se pudo realizar la llamada al número:" + num);
    }
  }


}
