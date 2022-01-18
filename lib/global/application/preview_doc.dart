import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PreviewDocPage extends StatelessWidget {
  const PreviewDocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pdf Visor Onlaw'),
          backgroundColor: MyColors.blackSecundario,
        ),
        body:  
        SfPdfViewer.network(
          Get.arguments.toString(),
        ),
        );
  }
}
