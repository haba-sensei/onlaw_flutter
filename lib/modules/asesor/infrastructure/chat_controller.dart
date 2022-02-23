import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/provider/chats_provider.dart';
import 'package:onlaw/data/provider/users_provider.dart';
import 'package:onlaw/modules/asesor/domain/message_model.dart';
import 'package:onlaw/modules/asesor/domain/solicitud_model.dart';
import 'package:onlaw/modules/asesor/infrastructure/asesor_controller.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/routes/routes_names.dart';

class ChatController extends GetxController {
  final SharedPref _sharedPref = SharedPref();
  UsersProvider usersProvider = UsersProvider();
  ChatsProvider chatsProvider = ChatsProvider();
  UserModel? user = UserModel();
  SolicitudModel? solicitud = SolicitudModel();
  List<SolicitudModel> solicitudes = [];
  List<MessageModel> mensajes = [];
  bool status = false;
  TextEditingController envioMensajeController = TextEditingController();
  late Timer timer;

  @override
  void onInit() async {
    user = UserModel.fromJson(await _sharedPref.read('user'));
    usersProvider.onInit();
    chatsProvider.onInit();

    update();
    super.onInit();
  }

  @override
  void onReady() {
    listMessage(Get.arguments.chatId);
    timer = Timer.periodic(const Duration(seconds: 2), streamMessage);
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  statusChat(String idChat) async {
    status = await chatsProvider.statusChat(idChat);
    if (status == true) {
      timer.cancel();
      Get.defaultDialog(
        title: "\n CHAT FINALIZADO",
        titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
        backgroundColor: MyColors.blackSecundario,
        barrierDismissible: false,
        radius: 20.0,
        content: Container(),
        onConfirm: () {
          Get.toNamed(Routes.asesor);
          Get.find<AsesorController>().listMyChats();
        },
        textConfirm: 'Aceptar',
        confirmTextColor: Colors.white,
      );
    }
  }

  listMessage(String idChat) async {
    mensajes = await chatsProvider.getMessage(idChat);
    update();
  }

  void streamMessage(dynamic _) {
    listMessage(Get.arguments.chatId);
    statusChat(Get.arguments.chatId);
  }

  void sendMessage(String idChat) async {
    if (envioMensajeController.text != '') {
      mensajes = await chatsProvider.send(
        envioMensajeController.text,
        Get.arguments.abogado.toString(),
        Get.arguments.cliente.toString(),
        Get.arguments.cliente.toString(),
        Get.arguments.chatId.toString(),
      );

      envioMensajeController.text = '';
      update();
    }
  }
}
