part of '../controllers.dart';

class HomeController extends GetxController {
  var peticionServerState = false.obs;

  final loginController = Get.find<LoginController>();
  AuthModel user = AuthModel.empty();


  int idSubTipoOperativo = 0;



  final LocalStorageRepository _localStorageRepository =
      Get.find<LocalStorageRepository>();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {

    user=loginController.user.value;


    super.onReady();
  }


}
