import 'package:flutter/material.dart';
import 'package:onlaw/modules/areas/widgets/icon_attach.dart';
import 'package:onlaw/modules/areas/widgets/icon_detalle.dart';
import 'package:onlaw/modules/areas/widgets/icon_images.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class DialogOpciones extends StatelessWidget {
  const DialogOpciones({Key? key, required this.item}) : super(key: key);

  final MenuContentModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconDetalle(detalle: item.detalle.toString()),
        const SizedBox(
          height: 20,
        ),
        IconImage(
          nivel: item.nivel.toString(),
          id: item.id.toString(),
        ),
        const SizedBox(
          height: 20,
        ),
        IconAttach(
          nivel: item.nivel.toString(),
          id: item.id.toString(),
        ),
      ],
    );
  }
}
