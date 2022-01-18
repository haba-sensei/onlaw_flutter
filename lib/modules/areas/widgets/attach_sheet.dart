import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/modules/areas/widgets/card_attach.dart';
import 'package:onlaw/shared/domain/attach_model.dart';

class ListAttachs extends StatelessWidget {
  const ListAttachs({Key? key, required this.attachs}) : super(key: key);
  final List<AttachModel> attachs;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColors.blackBasico,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
          child: attachs.isNotEmpty
              ? ListView(
                  children: attachs
                      .map((item) => CardAttach(
                            text: item.titulo.toString(),
                            url: item.urlAttach.toString(),
                          ))
                      .toList())
              : const Center(
                  child: Text(
                    'NO CONTIENE ARCHIVOS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
        ));
  }
}
