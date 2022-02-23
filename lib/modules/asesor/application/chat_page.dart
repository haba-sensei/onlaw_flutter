import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/breadcrumb_custom.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/asesor/domain/message_model.dart';
import 'package:onlaw/modules/asesor/infrastructure/chat_controller.dart';
import 'package:onlaw/routes/routes_names.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (_) {
          return Scaffold(
              extendBody: true,
              backgroundColor: MyColors.blackBasico,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: const CustomAppBar(),
              ),
              drawer: const DrawerLayout(
                page: 'CHAT',
              ),
              body: SafeArea(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                BreadcrumbCustom(
                  ruta: Routes.asesor,
                  text: Get.arguments.nombre.toString(),
                ),
                const SizedBox(height: 15),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: _.mensajes.length,
                        itemBuilder: (context, index) {
                          return messageBox(_.mensajes[index]);
                        })),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _.envioMensajeController,
                          decoration: InputDecoration(
                            hintText: 'Mensaje',
                            hintStyle: TextStyle(color: MyColors.blackSecundario, fontSize: 18),
                            fillColor: MyColors.blancoPastel,
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 20, right: 8, top: 8, bottom: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: MyColors.blancoPastel,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: MyColors.blancoPastel,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      CircleAvatar(
                          backgroundColor: Colors.green[500],
                          radius: 22,
                          child: IconButton(
                              onPressed: () {
                                _.sendMessage(
                                  Get.arguments.chatId,
                                );
                              },
                              color: MyColors.blancoPastel,
                              icon: const Icon(Icons.send)))
                    ],
                  ),
                ),
              ])));
        });
  }
}

Widget messageBox(MessageModel item) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      color: item.sender == item.cliente ? MyColors.blancoPastel : MyColors.mainColorOrange,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
    ),
    child: Text(
      item.mensaje.toString(),
      style: TextStyle(color: item.sender == item.cliente ? Colors.grey : Colors.white, fontSize: 20),
    ),
  );
}
