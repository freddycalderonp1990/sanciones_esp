



import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';


import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


import '../../../app/core/utils/algoritmo_TOTP.dart';

import '../../../app/core/utils/device_info.dart';
import '../../../app/domain/request/my_request.dart';
import 'package:path_provider/path_provider.dart';




import '../../core/utils/encriptar_util.dart';
import '../../core/utils/fotografia_util.dart';
import '../../core/utils/my_date.dart';
import '../../core/utils/parse_model.dart';
import '../../core/utils/save_file_mobile.dart';
import '../../core/values/app_colors.dart';
import '../../core/values/app_images.dart';
import '../../core/values/app_strings.dart';
import '../../data/models/models.dart';
import '../../data/models/models.dart';
import '../../data/providers/providers_impl.dart';
import 'package:flutter/foundation.dart';

import '../../core/utils/responsiveUtil.dart';



import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:typed_data';
import 'package:get/get.dart';

import '../../core/exceptions/exceptions.dart';

import '../../data/models/models.dart';
import '../../data/repository/data_repositories.dart';
import '../../domain/repositories/domain_repositories.dart';


import '../../core/app_config.dart';

import '../../core/utils/utilidadesUtil.dart';
import '../../presentation/routes/app_routes.dart';

import '../../core/utils/biometricUtil.dart';

import '../../core/utils/peticionServerState.dart';

import 'bindings.dart';







import '../../presentation/widgets/custom_app_widgets.dart';

import 'login/local_widgets/wgLogin.dart';

part 'pdf/pdf_view_controller.dart';

part 'home/home_controller.dart';
part 'splash/splash_controller.dart';
part 'login/login_controller.dart';
part 'login/inicio_rapido/inicio_rapido_controller.dart';
part 'sanciones/sanciones_controller.dart';
part 'qr_scanner/qr_scanner_controller.dart';
part 'sanciones/consulta_sanciones/consulta_sanciones_controller.dart';
