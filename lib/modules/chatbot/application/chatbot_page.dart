import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/global/widgets/dialog_opciones.dart';
import 'package:onlaw/modules/chatbot/infrastructure/chatbot_controller.dart';
import 'package:onlaw/routes/routes_names.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatbotController>(
      init: ChatbotController(),
      builder: (_) {
        return Scaffold(
          extendBody: true,
          backgroundColor: MyColors.blackBasico,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: const CustomAppBar(),
          ),
          drawer: const DrawerLayout(
            page: 'CHATBOT',
          ),
          bottomNavigationBar: const CustomBottonNavBar(),
          body: SafeArea(
              child: Stack(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 18),
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return otherMessage(_.contentChat);
                      })),
              Positioned(
                bottom: 100,
                left: -9,
                child: Container(
                  width: Get.mediaQuery.size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: MyColors.blackSecundario,
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          'Opciones',
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 130,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              _.consultMenu('0', '1', '-1');
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.restore_from_trash_rounded, color: Colors.white70),
                                Text(
                                  'Inicio',
                                  style: TextStyle(fontSize: 16, color: Colors.white70),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        width: Get.mediaQuery.size.width * 0.4,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(Routes.asesor);
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.orange[700]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.message_rounded, color: Colors.white70),
                                Text(
                                  'Asesor Legal',
                                  style: TextStyle(fontSize: 16, color: Colors.white70),
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 5,
                  // left: ,
                  child: SizedBox(
                    height: 100,
                    width: Get.mediaQuery.size.width,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: _.contentChat.length,
                                itemBuilder: (context, index) {
                                  return tags(index, _.contentChat);
                                })),
                      ],
                    ),
                  ))
            ],
          )),
        );
      },
    );
  }
}

Widget tags(int index, List<MenuContentModel> item) {
  return GetBuilder<ChatbotController>(
      init: ChatbotController(),
      builder: (_) {
        return BounceInRight(
          child: GestureDetector(
            onTap: () {
              _.consultMenu(item[index].id.toString(), item[index].nivel.toString(), '-1');
            },
            child: Container(
              width: 80,
              height: 89,
              decoration: BoxDecoration(
                color: Colors.orange[600],
              ),
              margin: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  index.toString(),
                  style: TextStyle(color: MyColors.blackSecundario, fontSize: 20),
                ),
              ),
            ),
          ),
        );
      });
}

Widget myMessage() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const Text('Jorge',
                style: TextStyle(
                  // fontFamily: "Sofia",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 15.0,
                )),
            const SizedBox(
              height: 3.0,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), topLeft: Radius.circular(30.0))),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Contenidos asdjasjdh ',
                  style: TextStyle(
                    color: Colors.white,
                    //  fontFamily: "Sofia"
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Image.network("https://image.flaticon.com/icons/png/512/3135/3135768.png"),
            backgroundColor: Colors.black12,
          ),
        ),
      ),
    ],
  );
}

Widget otherMessage(List<MenuContentModel> lista) {
  return Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
    Container(
      margin: const EdgeInsets.only(right: 16.0, top: 5),
      child: CircleAvatar(
        child: Image.network("https://image.flaticon.com/icons/png/512/3649/3649460.png"),
        backgroundColor: Colors.black12,
      ),
    ),
    Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Asistente Chatbot',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  // fontFamily: "Sofia",
                  color: Colors.white),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Hola,  para continuar elige una opción',
                    style: TextStyle(
                      color: Colors.white,
                      // fontFamily: "Sofia"
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  height: Get.mediaQuery.size.height * 0.55,
                  child: ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      return opciones(lista[index], index);
                    },
                  ))
            ],
          ),
        ],
      ),
    ),
  ]);
}

Widget opciones(MenuContentModel item, index) {
  return BounceInUp(
    child: Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.blackSecundario,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.mediaQuery.size.width * 0.65,
              child: Text(
                index.toString() + ' - ' + item.nombre.toString(),
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
                onTap: () {
                  Get.defaultDialog(
                    title: "ELIGE UNA OPCIÓN",
                    titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    backgroundColor: MyColors.blackSecundario,
                    content: DialogOpciones(item: item),
                    barrierDismissible: true,
                    radius: 20.0,
                  );
                },
                child:
                    CircleAvatar(backgroundColor: Colors.transparent, child: Icon(Icons.zoom_in_rounded, color: MyColors.mainColorOrange, size: 35))),
          ],
        ),
      ),
    ),
  );
}
