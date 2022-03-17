import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences? _prefs;

  Future<SharedPreferences> _getPref() async {
    _prefs ??= await SharedPreferences.getInstance();
    return Future.value(_prefs);
  }

  Future<bool> getIfUserIsLogged() async {
    final prefs = await _getPref();

    return Future.value(true);
  }

  Future<bool> login() async {
    final prefs = await _getPref();

    return Future.value(true);
  }

  Future<bool> logout() async {
    final prefs = await _getPref();
    return Future.value(true);
  }
}
