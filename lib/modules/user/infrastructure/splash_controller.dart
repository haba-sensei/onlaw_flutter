// ignore_for_file: unused_import, unnecessary_overrides

import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/routes/routes_names.dart';
// import 'package:unpanamas/src/data/services/push_notifications_service.dart';

// PushNotificationProvider pushNotificationProvider =
//     PushNotificationProvider();

class SplashController extends GetxController {
  UsersProvider usersProvider = UsersProvider();
  final SharedPref _sharedPref = SharedPref();

  @override
  void onInit() async {
    // pushNotificationProvider.onMessageListener();
    super.onInit();
  }

  @override
  void onReady() async {
    UserModel user = UserModel.fromJson(await _sharedPref.read('user') ?? {});
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (user.deviceToken != null) {
        Get.offNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login);
      }
    });
    super.onReady();
  }
}
