


import 'data/repository/data_repositories.dart';


import 'data/providers/providers_impl.dart';
import 'domain/repositories/domain_repositories.dart';

import 'package:get/get.dart';


class DependencyInjection extends Bindings{

  static ini(){


    //repositori
    //Al utilizar lazuPut solo se crea una vez la dependencia,
    //con fenix: true, le decimos que se vuelva a crear cuando la necesitamos
    Get.lazyPut<LocalStorageRepository> (() => LocalStoreImpl(), fenix: true);
    //APIS
    Get.lazyPut<AuthRepository> (() => AuthApiImpl(), fenix: true);
    Get.lazyPut<SancionesRepository> (() => SancionesApiImpl(), fenix: true);
    Get.lazyPut<PersonRepository> (() => PersonApiImpl(), fenix: true);

    Get.lazyPut<LocalStoreImpl> (() => LocalStoreImpl(), fenix: true);
    Get.lazyPut<AuthApiImpl> (() => AuthApiImpl(), fenix: true);
    Get.lazyPut<SancionesApiImpl> (() => SancionesApiImpl(), fenix: true);
    Get.lazyPut<PersonApiImpl> (() => PersonApiImpl(), fenix: true);




    //Providers
    Get.lazyPut<LocalStoreProviderImpl> (() => LocalStoreProviderImpl(), fenix: true);
    //APIS
    Get.lazyPut<AuthApiProviderImpl> (() => AuthApiProviderImpl(), fenix: true);
    Get.lazyPut<SancionesApiProviderImpl> (() => SancionesApiProviderImpl(), fenix: true);
    Get.lazyPut<PersonApiProviderImpl> (() => PersonApiProviderImpl(), fenix: true);


  }

  @override
  void dependencies() {
    print('DependencyInjection');
    ini();


  }


}