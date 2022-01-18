import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';

class ProfileController extends GetxController {
  ProfileController();
  var items = ['RUC', 'CEDULA'];
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
  void onInit() {
    usersProvider.onInit();
    super.onInit();
  }

  @override
  void onReady() async {
    UserModel user = UserModel.fromJson(await _sharedPref.read('user'));

    numDocumentController.text = user.numDocument.toString().trim();

    // print(user.toJson());
    super.onReady();
  }
}
