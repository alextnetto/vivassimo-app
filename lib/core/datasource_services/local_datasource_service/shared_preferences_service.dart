import 'package:my_app/core/contracts/i_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements ILocalStorageService {
  var prefs;
  SharedPreferencesService() {
    SharedPreferences.getInstance().then((value) => prefs = value);
  }
  @override
  Future cleanCache(String chave) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(chave);
  }

  @override
  Future getCache(String chave) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(chave);
  }

  @override
  Future<bool> setCache(String chave, valor) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    if (valor.runtimeType == bool) {
      prefs.setBool(chave, valor);
    } else if (valor.runtimeType == int) {
      prefs.setInt(chave, valor);
    } else if (valor.runtimeType == double) {
      prefs.setDouble(chave, valor);
    } else {
      prefs.setString(chave, valor);
    }
    // print('dados gravados');
    // print(prefs.get(chave).toString());
    return true;
  }

  // initSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }
}
