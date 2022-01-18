import 'package:flutter/material.dart';
import 'package:onlaw/modules/areas/widgets/card_color.dart';
import 'package:onlaw/modules/areas/widgets/card_title.dart';
import 'package:onlaw/modules/areas/widgets/icon_attach.dart';
import 'package:onlaw/modules/areas/widgets/icon_detalle.dart';
import 'package:onlaw/modules/areas/widgets/icon_images.dart';

class CardCont extends StatelessWidget {
  const CardCont({Key? key, required this.item}) : super(key: key);
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 20),
      child: Column(
        children: <Widget>[
          CardTitle(
            title: item.nombre.toString(),
            id: item.id.toString(),
          ),
          Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.white12,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconDetalle(detalle: item.detalle.toString()),
                  IconImage(
                    nivel: item.nivel.toString(),
                    id: item.id.toString(),
                  ),
                  IconAttach(
                    nivel: item.nivel.toString(),
                    id: item.id.toString(),
                  ),
                ],
              ),
            ),
          ),
          CardColor(color: Color(int.parse('0xFF' + item.color.toString())))
        ],
      ),
    );
  }
}
