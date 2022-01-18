import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/menu_content_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/user/domain/user_model.dart'; 
import 'package:onlaw/shared/domain/menu_content_model.dart';

class ContenidoAreaController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  MenuContentProvider menuContentProvider = MenuContentProvider();
  UserModel? user = UserModel();
  List<MenuContentModel> areaCont = [];

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
    listCont();
    super.onReady();
  }

  listCont() async {
    areaCont = await menuContentProvider.getAreasCont(Get.arguments.id.toString());
    update();
  }

}
