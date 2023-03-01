part of 'mods_impl.dart';

class AuthApiProviderModsImpl extends AuthRepository {
  @override
  Future<AuthModel> auth(AuthRequest authRequest) async {

    final String json = await rootBundle.loadString('assets/json/auth.json');

    return authModelFromJson(json);
  }

  @override
  Future<void> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
