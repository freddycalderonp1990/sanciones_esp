
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';


import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'dart:io' as doc;

//NECESARIOS PARA SUBIR ARCHIVOS
import 'package:async/async.dart'; //DelegatingStream
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';



import '../../../app/core/exceptions/exception_helper.dart';
import '../../../app/core/exceptions/exceptions.dart';



import '../../core/app_config.dart';
import '../../core/utils/parse_model.dart';
import '../../core/utils/photo_helper.dart';

import '../../data/models/models.dart';
import '../../domain/repositories/domain_repositories.dart';
import '../../domain/request/my_request.dart';
import '../repository/data_repositories.dart';





part 'remote/apis/auth_api_provider.dart';


part 'local/local_store_provider.dart';
part 'remote/apis/host/host.dart';
part 'remote/apis/host/url_api_provider.dart';
part 'remote/apis/host/cabecera_json_model.dart';
part 'remote/apis/sanciones_api_provider.dart';
part 'remote/apis/person_api_provider.dart';





