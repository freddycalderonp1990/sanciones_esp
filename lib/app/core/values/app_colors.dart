import 'package:flutter/material.dart' show Color, Colors, MaterialColor;

class AppColors {
  static Color prymary = AppColors.colorAzulSecond;
  static Color second = AppColors.colorAzul;

  static final dark = Color(0xFF03091E);

  static const Color colorTextos =Colors.white;

  static const Color colorBotones = AppColors.colorAzulSecond_20;
  static const Color colorCajas = Color(0XFFeceff4);


 static  MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }


  static  MaterialColor colorBackground = getMaterialColor(colorAzul);



  static const Color colorBordeBotones = Colors.red;
  static const Color colorBordecajas =Colors.white;

  //AZUL INSTITUCIONAL
  static const int rAzul = 22, gAzul = 73, bAzul = 135;
  static const Color colorAzul = Color.fromRGBO(rAzul, gAzul, bAzul, 100);
  static const Color colorAzul_80 = Color.fromRGBO(rAzul, gAzul, bAzul, 80);
  static const Color colorAzul_60 = Color.fromRGBO(rAzul, gAzul, bAzul, 60);
  static const Color colorAzul_40 = Color.fromRGBO(rAzul, gAzul, bAzul, 40);
  static const Color colorAzul_20 = Color.fromRGBO(rAzul, gAzul, bAzul, 20);

  //AZUL INSTITUCIONAL SECUNDARIO
  static const int rAzulSecond = 26, gAzulSecond = 70, bAzulSecond = 141;
  static const Color colorAzulSecond =
      Color.fromRGBO(rAzulSecond, gAzulSecond, bAzulSecond, 100);
  static const Color colorAzulSecond_80 =
      Color.fromRGBO(rAzulSecond, gAzulSecond, bAzulSecond, 80);
  static const Color colorAzulSecond_60 =
      Color.fromRGBO(rAzulSecond, gAzulSecond, bAzulSecond, 60);
  static const Color colorAzulSecond_40 =
      Color.fromRGBO(rAzulSecond, gAzulSecond, bAzulSecond, 40);
  static const Color colorAzulSecond_20 =
      Color.fromRGBO(rAzulSecond, gAzulSecond, bAzulSecond, 20);

  //PLOMO INSTITUCIONAL
  static const int rPlomo = 167, gPlomo = 169, bPlomo = 172;
  static const Color colorPlomo = Color.fromRGBO(rPlomo, gPlomo, bPlomo, 40);
  static const Color colorPlomo_100 = Color.fromRGBO(rPlomo, gPlomo, bPlomo, 100);
  static const Color colorPlomo_80 = Color.fromRGBO(rPlomo, gPlomo, bPlomo, 80);
  static const Color colorPlomo_60 = Color.fromRGBO(rPlomo, gPlomo, bPlomo, 60);
  static const Color colorPlomo_20 = Color.fromRGBO(rPlomo, gPlomo, bPlomo, 20);

  static const Color colorContenedores = Color.fromRGBO(167, 169, 172, 40);

  //AMARILLO
  static const int rAmarillo = 255, gAmarillo = 211, bAmarillo = 0;
  static const Color colorAmarillo = Color.fromRGBO(rAmarillo, gAmarillo, bAmarillo, 100);
  static const Color colorAmarillo_80 = Color.fromRGBO(rAmarillo, gAmarillo, bAmarillo, 80);
  static const Color colorAmarillo_60 = Color.fromRGBO(rAmarillo, gAmarillo, bAmarillo, 60);
  static const Color colorAmarillo_40 = Color.fromRGBO(rAmarillo, gAmarillo, bAmarillo, 40);
  static const Color colorAmarillo_20 = Color.fromRGBO(rAmarillo, gAmarillo, bAmarillo, 20);

  //ROJO
  static const int rRojo = 337, gRojo = 28, bRojo = 36;
  static const Color colorRojo = Color.fromRGBO(rRojo, gRojo, bRojo, 100);
  static const Color colorRojo_80 = Color.fromRGBO(rRojo, gRojo, bRojo, 80);
  static const Color colorRojo_60 = Color.fromRGBO(rRojo, gRojo, bRojo, 60);
  static const Color colorRojo_40 = Color.fromRGBO(rRojo, gRojo, bRojo, 40);
  static const Color colorRojo_20 = Color.fromRGBO(rRojo, gRojo, bRojo, 20);

  //VERDE
  static const int rVerde = 0, gVerde = 131, bVerde = 62;
  static const Color colorVerde = Color.fromRGBO(rVerde, gVerde, bVerde, 100);
  static const Color colorVerde_80 = Color.fromRGBO(rVerde, gVerde, bVerde, 80);
  static const Color colorVerde_60 = Color.fromRGBO(rVerde, gVerde, bVerde, 60);
  static const Color colorVerde_40 = Color.fromRGBO(rVerde, gVerde, bVerde, 40);
  static const Color colorVerde_20 = Color.fromRGBO(rVerde, gVerde, bVerde, 20);
}
