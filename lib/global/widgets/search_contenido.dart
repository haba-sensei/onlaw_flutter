import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/dialog_opciones.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class SearchContenido extends StatelessWidget {
  const SearchContenido({Key? key, required this.lista, required this.ruta}) : super(key: key);
  final MenuContentModel lista;
  final String ruta;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          height: Get.mediaQuery.size.height,
          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 210, childAspectRatio: 2 / 1.9, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemCount: 1,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext ctx, index) {
                return Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          // if(lista[index].){

                          // }
                          Get.toNamed(ruta, arguments: lista);
                          // print(lista[index].nivel);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Image.asset(
                                'assets/image/folder2.png',
                              ),
                              radius: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                lista.nombre.toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(color: MyColors.blackSecundario, borderRadius: BorderRadius.circular(15)),
                    ),
                    Positioned(
                        right: 5,
                        top: 10,
                        child: Icon(
                          Icons.touch_app_rounded,
                          color: Colors.orange[600],
                        )),
                    Positioned(
                      bottom: -8,
                      child: SizedBox(
                        width: Get.mediaQuery.size.width * 0.44,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.defaultDialog(
                                title: "ELIGE UNA OPCIÓN",
                                titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                                backgroundColor: MyColors.blackSecundario,
                                content: DialogOpciones(item: lista),
                                barrierDismissible: true,
                                radius: 20.0,
                              );
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.orange[600]),
                            child: const Text('Ver Opciones')),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
