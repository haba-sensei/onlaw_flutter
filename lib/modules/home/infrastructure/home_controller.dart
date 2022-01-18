import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/menu_content_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/global/controllers/general_controller.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class HomeController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  MenuContentProvider menuContentProvider = MenuContentProvider();
  UserModel? user = UserModel();
  List<MenuContentModel> area = [];

  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    menuContentProvider.onInit();
    Get.put(GeneralController());
    update();
    super.onInit();
  }

  @override
  void onReady() {
    listArea();
    super.onReady();
  }

  listArea() async {
    area = await menuContentProvider.getAreas();

    update();
  }
}
