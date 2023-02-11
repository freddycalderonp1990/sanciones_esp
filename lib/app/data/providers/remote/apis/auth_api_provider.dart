part of '../../providers_impl.dart';


class AuthApiProviderImpl extends AuthRepository {
  @override
  Future<AuthModel> auth(AuthRequest authRequest) async {


      Object? body = {
        "username": authRequest.username,
        "password": authRequest.password,

      };


      String json = await UrlApiProvider.post(
          isLogin: true, body: body, segmento: 'api/token/create');


      return authModelFromJson(json);

  }

  @override
  Future<void> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }



}
