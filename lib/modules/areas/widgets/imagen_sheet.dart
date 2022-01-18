import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/shared/domain/images_model.dart';
import 'package:photo_view/photo_view.dart';

class ListImages extends StatelessWidget {
  const ListImages({Key? key, required this.images}) : super(key: key);

  final List<ImagesModel> images;
  final _remote = Environment.remoteConexion + 'images/areas/';

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColors.blackBasico,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
          child: images.isNotEmpty
              ? GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  children: images.map((items) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                              child: FullScreenWidget(
                                child: Center(
                                  child: Hero(
                                    tag: "customTag",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: PhotoView(
                                          imageProvider: NetworkImage(_remote + items.urlImagen.toString()),
                                          backgroundDecoration: BoxDecoration(
                                            color: MyColors.blackSecundario,
                                          )),
                                      //  fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )),
                        );
                      },
                    );
                  }).toList(),
                )
              : const Center(
                  child: Text(
                    'NO CONTIENE IMAGENES',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ));
  }
}
