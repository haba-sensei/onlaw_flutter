// import 'dart:async';
// import 'package:file_picker/file_picker.dart';
// import 'package:onlaw/data/source/remote/env_remote.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;

// import 'dart:io';

// class PDFApi {
//   static Future<File> loadNetwork(String url) async {
//     final _remote = Environment.apiConexion;

//     Uri urlFormat = Uri.http(_remote, 'files/$url');

//     final response = await http.get(urlFormat);

//     final bytes = response.bodyBytes;

//     return _storeFile(url, bytes);
//   }

//   // static Future<File?> pickFile() async {
//   //   final result = await FilePicker.platform.pickFiles(
//   //     type: FileType.custom,
//   //     allowedExtensions: ['pdf'],
//   //   );

//   //   return File(result.path);
//   // }

//   static Future<File> _storeFile(String url, List<int> bytes) async {
//     final filename = basename(url);
//     final dir = await getApplicationDocumentsDirectory();

//     final file = File('${dir.path}/$filename');
//     await file.writeAsBytes(bytes, flush: true);
//     return file;
//   }
// }
