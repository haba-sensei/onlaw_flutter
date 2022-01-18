import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:onlaw/modules/areas/infrastructure/opciones_controller.dart';

class IconDetalle extends StatelessWidget {
  const IconDetalle({Key? key, required this.detalle}) : super(key: key);

  final String detalle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OpcionesController>(
      init: OpcionesController(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            _.detalles(detalle);
          },
          child: Row(
            children: [ 
              Image.asset(
                'assets/image/palabra.png',
                height: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('DETALLES', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))
            ],
          ),
        );
      },
    );
  }
}
