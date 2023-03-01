


import 'data/providers/remote/apis/mods/mods_impl.dart';
import 'data/repository/data_repositories.dart';


import 'data/providers/providers_impl.dart';
import 'domain/repositories/domain_repositories.dart';

import 'package:get/get.dart';


class DependencyInjection extends Bindings{

  static ini(){

   // Get.lazyPut<LocalStoreImpl>(() =>LocalStoreImpl(LocalStoreProviderImpl()), fenix: true);
    Get.put<LocalStoreImpl>(LocalStoreImpl(LocalStoreProviderImpl()));


  /*  Get.lazyPut<AuthApiImpl>(() =>AuthApiImpl(AuthApiProviderImpl()), fenix: true);
    Get.lazyPut<PersonApiImpl>(() =>PersonApiImpl(PersonApiProviderImpl()), fenix: true);
    Get.put<SancionesApiImpl>(SancionesApiImpl(SancionesApiProviderImpl()));*/


    Get.lazyPut<AuthApiImpl>(() =>AuthApiImpl(AuthApiProviderModsImpl()), fenix: true);
    Get.lazyPut<PersonApiImpl>(() =>PersonApiImpl(PersonApiProviderModsImpl()), fenix: true);
    Get.put<SancionesApiImpl>(SancionesApiImpl(SancionesApiProviderModsImpl()));


    //Repositori
    Get.lazyPut<LocalStorageRepository> (() => LocalStoreImpl(LocalStoreProviderImpl()), fenix: true);

   // Get.lazyPut<AuthApiProviderModsImpl>(() =>AuthApiProviderModsImpl());

    /*

    //repositori
    //Al utilizar lazuPut solo se crea una vez la dependencia,
    //con fenix: true, le decimos que se vuelva a crear cuando la necesitamos
    Get.lazyPut<LocalStorageRepository> (() => LocalStoreImpl(), fenix: true);
    //APIS
   // Get.lazyPut<AuthRepository> (() => AuthApiImpl(AuthApiProviderModsImpl), fenix: true);
    Get.lazyPut<SancionesRepository> (() => SancionesApiImpl(), fenix: true);
    Get.lazyPut<PersonRepository> (() => PersonApiImpl(), fenix: true);

    Get.lazyPut<LocalStoreImpl> (() => LocalStoreImpl(), fenix: true);
    //Get.lazyPut<AuthApiImpl> (() => AuthApiImpl(AuthApiProviderModsImpl), fenix: true);
    Get.lazyPut<SancionesApiImpl> (() => SancionesApiImpl(), fenix: true);
    Get.lazyPut<PersonApiImpl> (() => PersonApiImpl(), fenix: true);




    //Providers
    Get.lazyPut<LocalStoreProviderImpl> (() => LocalStoreProviderImpl(), fenix: true);
    //APIS
   // Get.lazyPut<AuthApiProviderImpl> (() => AuthApiProviderImpl(), fenix: true);
    Get.lazyPut<AuthApiProviderModsImpl> (() => AuthApiProviderModsImpl(), fenix: true);


    Get.lazyPut<SancionesApiProviderImpl> (() => SancionesApiProviderImpl(), fenix: true);
    Get.lazyPut<PersonApiProviderImpl> (() => PersonApiProviderImpl(), fenix: true);

*/
  }

  @override
  void dependencies() {
    print('DependencyInjection');
    ini();


  }

  //Get.put();
//se usa para insertar el controlador en la memoria y se inserta inmediatamente cuando
// se inicia la aplicación. Porque Getx inicializará el controlador antes de usarlo.


//Get.lazyPut()
//también se utiliza para insertar el controlador en la memoria. Pero solo se llama cuando
//los usa con una determinada vista o los llama.
//Una vez que llame a un controlador o sus instancias, se cargará en la memoria inmediatamente y estará listo para usar en ese momento.

//Get.putAsync()
//se cargan los recursos perezosamente y también esperan. Debe inyectar el controlador usando esto si carga recursos para
// espacio externo como almacenamiento o base de datos.
//Entonces, si su controlador devuelve Future, entonces debe usar Get.putAsync() para inyectar recursos.

}