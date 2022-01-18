import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/data/source/response_api.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/routes/routes_names.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  final SharedPref _sharedPref = SharedPref();

  @override
  Future<void> onInit() async {
    super.onInit();
    usersProvider.onInit();
  }

  login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Detalle del error: ', 'Campos Vacios',
          backgroundColor: MyColors.grisMain,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          isDismissible: true,
          icon: const Icon(
            Icons.error_outlined,
            size: 37,
            color: Colors.white,
          ),
          onTap: (_) => Get.back(),
          duration: const Duration(seconds: 3),
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP);
      return;
    }

    ResponseApi? responseApi = await usersProvider.login(email, password);

    if (responseApi!.success) {
      UserModel user = UserModel.fromJson(responseApi.data);

      _sharedPref.save('user', user.toJson());

      Get.defaultDialog(
        title: 'Iniciando session..',
        content: const CircularProgressIndicator(),
      );

      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offNamedUntil(Routes.home, (route) => false);
      });
    } else {
      emailController.text = '';
      passwordController.text = '';

      Get.snackbar('Detalle del error: ', responseApi.error,
          backgroundColor: MyColors.grisMain,
          colorText: Colors.white,
          snackStyle: SnackStyle.FLOATING,
          isDismissible: true,
          icon: const Icon(
            Icons.error_outlined,
            size: 37,
            color: Colors.white,
          ),
          onTap: (_) => Get.back(),
          duration: const Duration(seconds: 3),
          shouldIconPulse: true,
          snackPosition: SnackPosition.TOP);
      return;
    }
  }
}
