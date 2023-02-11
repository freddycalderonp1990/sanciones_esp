part of '../../data_repositories.dart';

class AuthApiImpl extends AuthRepository {
  final AuthApiProviderImpl _authApiProviderImpl = Get.find();

  @override
  Future<AuthModel> auth(AuthRequest authRequest) async {
    try {
      AuthModel user = await _authApiProviderImpl.auth(authRequest);

      return user;
    }  catch (e){
      throw ExceptionHelper.captureError(e);
    }

  }

  @override
  Future<void> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }


}
