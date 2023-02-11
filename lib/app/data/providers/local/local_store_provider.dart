part of '../providers_impl.dart';

const _PREF_TOKEN = 'TOKEN';
const _PREF_USER = 'USER';
const _PREF_PASS = 'PASS';
const _PREF_FOTO = 'FOTO';
const _PREF_APP_INICIAL =
    'APP_INICIAL'; // sirve para controlar si el usuario recien instalo la aplicacion y mostrarle directamente el login
const _PREF_TIENE_HUELLA = 'TIENE_HUELLA';
const _PREF_USER_NAME = 'USER_NAME';
const _PREF_THEME = 'THEME_DARK';
const _PREF_CONTADOR_FALLIDO =
    'CONTADOR_FALLIDO'; //Cuando el usuario a cambiado la clave y al precionar la huella por segunda  vez y no ingresa tiene que reiniciarse
//para que se loguee con su nueva cuenta

const _PREF_USER_JSON = 'USER_JSON';

const _PREF_CODE_PIN = 'CODE_PIN';

class LocalStoreProviderImpl extends LocalStorageRepository {
  @override
  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String data = prefs.getString(_PREF_TOKEN) ?? '';

    return data;
/*
    if (data == '') {
      return null;
    }

    print('la fecha es:${data}');

    var date = DateFormat('dd-MM-yyyy HH:mm:ss').parse(data);

    print('la fecha es:${date.toString()}');
    print('la fecha es:${DateTime.now()}');
    if (DateTime.now().isBefore(date)) {
      print('Token Aun Valido');
      return data;
    } else {
      await this.setToken('');
      return null;
    }*/
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) {
      prefs.setString(_PREF_TOKEN, token);
    } else {
      prefs.setString(_PREF_TOKEN, '');
    }
  }

  @override
  Future<void> setUserModel(AuthModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String jsonString = authModelToJson(user);

    prefs.setString(_PREF_USER_JSON, jsonString);

    final String data1 = prefs.getString(_PREF_USER_JSON) ?? '';

    print("jsonString ${jsonString}");
  }

  @override
  Future<AuthModel> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String data = prefs.getString(_PREF_USER_JSON) ?? '';

    if (data == '') {
      return AuthModel.empty();
    }

    return authModelFromJson(data);
  }

  @override
  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_USER) ?? '';
  }

  @override
  Future<void> setUser(String user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_USER, user);
  }

  @override
  Future<Uint8List?> getFoto() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String foto = prefs.getString(_PREF_FOTO) ?? '';
    if (foto == '') {
      return null;
    }
    return PhotoHelper.convertStringToUint8List(foto);
  }

  @override
  Future<void> setFoto(String? foto) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (foto == null) {
      foto = '';
    }
    prefs.setString(_PREF_FOTO, foto);
  }

  @override
  Future<String> getPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_PASS) ?? '';
  }

  @override
  Future<void> setPass(String pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_PASS, pass);
  }

  @override
  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_USER_NAME) ?? '';
  }

  @override
  Future<void> setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_USER_NAME, userName);
  }

  @override
  Future<bool> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_THEME) ?? false;
  }

  @override
  Future<void> setDarkMode(bool isThemeDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_THEME, isThemeDark);
  }

  @override
  Future<bool> getAppInicial() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_APP_INICIAL) ?? false;
  }

  @override
  Future<bool> getConfigHuella() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_PREF_TIENE_HUELLA) ?? false;
  }

  @override
  Future<void> setAppInicial(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_APP_INICIAL, value);
  }

  @override
  Future<void> setConfigHuella(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_PREF_TIENE_HUELLA, value);
  }

  //Cuando el usuario a cambiado la clave y al precionar la huella por segunda  vez y no ingresa tiene que reiniciarse
  //para que se loguee con su nueva cuenta
  @override
  Future<int> getContadorFallido() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_PREF_CONTADOR_FALLIDO) ?? 0;
  }

  @override
  Future<void> setContadorFallido(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(_PREF_CONTADOR_FALLIDO, value);
  }

  @override
  Future<String> getPinCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_PREF_CODE_PIN) ?? '';
  }

  @override
  Future<void> setPinCode(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_PREF_CODE_PIN, value);
  }
}
