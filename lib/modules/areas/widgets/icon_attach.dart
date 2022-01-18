import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:onlaw/modules/areas/infrastructure/opciones_controller.dart';

class IconAttach extends StatelessWidget {
  const IconAttach({Key? key, required this.nivel, required this.id}) : super(key: key);

  final String nivel, id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OpcionesController>(
      init: OpcionesController(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.listAttachs(nivel, id);
          },
          child: Row(
            children: [ 
              Image.asset(
                'assets/image/zip.png',
                height: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('ARCHIVOS', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))
            ],
          ),
        );
      },
    );
  }
}
