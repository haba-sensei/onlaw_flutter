import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/data/source/response_api.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/routes/routes_names.dart';

class RegisterController extends GetxController { 
  String documentController = 'RUC';
  TextEditingController numDocumentController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController dniPasaporteController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController confirmarPassController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  final SharedPref _sharedPref = SharedPref();

  @override
  Future<void> onInit() async {
    super.onInit();
    usersProvider.onInit();
  }

  register() async {
    String document = documentController.trim();
    String numDocument = numDocumentController.text.trim();
    String fullname = fullnameController.text.trim();
    String dniPasaporte = dniPasaporteController.text.trim();
    String email = emailController.text.trim();
    String telefono = telefonoController.text.trim();
    String direccion = direccionController.text.trim();
    String confirmarPass = confirmarPassController.text.trim();
    String password = passwordController.text.trim();

    if (numDocument.isEmpty ||
        fullname.isEmpty ||
        dniPasaporte.isEmpty ||
        email.isEmpty ||
        telefono.isEmpty ||
        direccion.isEmpty ||
        confirmarPass.isEmpty ||
        password.isEmpty) {
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

    UserModel user = UserModel(
        document: document,
        numDocument: numDocument,
        fullname: fullname,
        dniPasaporte: dniPasaporte,
        email: email,
        telefono: telefono,
        direccion: direccion,
        password: password);

    ResponseApi? responseApi = await usersProvider.create(user);

    if (responseApi!.success) {
      ResponseApi? responseApiLogin =
          await usersProvider.login(email, password);

      if (responseApiLogin!.success) {
        UserModel user = UserModel.fromJson(responseApiLogin.data);
        _sharedPref.save('user', user.toJson());

        Get.snackbar('Detalle del mensaje: ', 'Usuario registrado con exito!',
            backgroundColor: MyColors.mainColorOrange,
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
            isDismissible: true,
            icon: const Icon(
              Icons.notifications_active_rounded,
              size: 37,
              color: Colors.white,
            ),
            onTap: (_) => Get.back(),
            shouldIconPulse: true,
            snackPosition: SnackPosition.TOP);

        Get.defaultDialog(
            title: 'Iniciando session..',
            content: const CircularProgressIndicator(),
            barrierDismissible: false);
        Future.delayed(const Duration(milliseconds: 1500), () {
          Get.offNamedUntil(Routes.home, (route) => false);
        });
      } else {
        Get.snackbar('Detalle del mensaje: ', responseApiLogin.message,
            backgroundColor: MyColors.grisMain,
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
            isDismissible: true,
            icon: const Icon(
              Icons.notifications_active_rounded,
              size: 37,
              color: Colors.white,
            ),
            onTap: (_) => Get.back(),
            shouldIconPulse: true,
            snackPosition: SnackPosition.TOP);
      }
    } else {
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
