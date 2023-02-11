import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/theme/app_theme.dart';
import 'dependency_injection.dart';
import 'presentation/routes/app_pages.dart';
import 'presentation/routes/app_routes.dart';

import 'core/values/app_colors.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: ThemeData(
        // Define el Brightness y Colores por defecto
        backgroundColor: AppColors.colorBackground,

        // Define la Familia de fuente por defecto
        fontFamily: 'Bookman Old Style',

        // Define el TextTheme por defecto. Usa esto para espicificar el estilo de texto por defecto
        // para cabeceras, títulos, cuerpos de texto, y más.

      ),


      debugShowCheckedModeBanner: false,

      locale: window.locale,// translations will be displayed in that locale
      fallbackLocale: window.locale,
      initialRoute:  AppRoutes.SPLASH,
      initialBinding: DependencyInjection(),
      getPages: AppPages.pages,
      home: Scaffold(
     backgroundColor: AppColors.colorBackground,
        body: SafeArea(

          child: Center(
            child: Text('Hola'),
          ),
        ),
      ),
    );
  }
}
