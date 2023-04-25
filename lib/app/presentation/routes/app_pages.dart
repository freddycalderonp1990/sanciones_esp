import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/bindings.dart';
import '../modules/pages.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final _transition = Transition.rightToLeft;
  static final _transitionDuration = const Duration(milliseconds: 400);
  static final _curve = Curves.fastOutSlowIn;

  static GetPage getPageConfig({required String name,required GetPageBuilder page, required  Bindings binding} ) {
    return GetPage(
        transition: _transition,
        transitionDuration: _transitionDuration,
        curve: _curve,
        name: name,
        page: page,
        binding: binding);
  }

  static final List<GetPage> pages = [
    getPageConfig(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),

    getPageConfig(

        name: AppRoutes.HOME,
        page: () => HomePage(),
        binding: HomeBinding()),
    getPageConfig(

        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    getPageConfig(

        name: AppRoutes.LOGIN_RAPIDO,
        page: () => InicioRapidoPage(),
        binding: InicioRapidoBinding()),

    getPageConfig(
        name: AppRoutes.SANCIONES,
        page: () => SancionesPage(),
        binding: SancionesBinding()),

    getPageConfig(
        name: AppRoutes.SANCIONES_CONSULT,
        page: () => ConsultaSancionesPage(),
        binding: ConsultaSancionesBinding()),

    getPageConfig(
        name: AppRoutes.PDFVIEW,
        page: () => PdfViewPage(),
        binding: PdfViewBinding()),





  ];
}
