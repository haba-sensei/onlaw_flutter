import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/menu_content_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/routes/routes_names.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class GeneralController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  MenuContentProvider menuContentProvider = MenuContentProvider();
  UserModel? user = UserModel();
  List<MenuContentModel> suggestions = [];

  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    menuContentProvider.onInit();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    listSugerencias();
    super.onReady();
  }

  listSugerencias() async {
    suggestions = await menuContentProvider.getSuggestions();
    update();
  }

  manejadorRuta(String nivel) {
    switch (nivel) {
      case '1':
        return Routes.contenidoArea;
      case '2':
        return Routes.detContArea;
      case '3':
        return Routes.mapa;
      case '4':
        return Routes.mapaSub;
      case '5':
        return Routes.contenidoArea;
      case '6':
        return Routes.contenidoArea;
      case '7':
        return Routes.contenidoArea;
    }
  }
}
