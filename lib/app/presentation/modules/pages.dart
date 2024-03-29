
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/photo_helper.dart';
import '../../core/utils/utilidadesUtil.dart';
import '../../data/models/models.dart';
import '../widgets/custom_app_widgets.dart';
import 'package:get/get.dart';
import '../../../app/presentation/routes/app_routes.dart';

import '../widgets/qr_sanner_widget.dart';
import 'controllers.dart';

import '../../core/utils/responsiveUtil.dart';
import '../../core/values/app_images.dart';
import '../../core/values/app_colors.dart';
import '../../core/app_config.dart';
import '../../presentation/modules/login/local_widgets/workAreaLoginPageWidget.dart';
import '../../presentation/modules/login/local_widgets/desingBtn.dart';
import '../../presentation/modules/login/local_widgets/wgLogin.dart';
import 'sanciones/consulta_sanciones/local_widgets/consulta_sanciones_widget.dart';
import 'sanciones/local_widgets/wg_tipo_busqueda.dart';

part 'pdf/pdf_view_page.dart';

part 'home/home_page.dart';
part 'splash/splash_page.dart';
part 'login/login_page.dart';
part 'login/inicio_rapido/inicio_rapido_page.dart';
part 'sanciones/sanciones_page.dart';
part 'qr_scanner/qr_scanner_page.dart';
part 'sanciones/consulta_sanciones/consulta_sanciones_page.dart';



