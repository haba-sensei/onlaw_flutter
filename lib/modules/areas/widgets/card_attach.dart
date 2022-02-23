import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/routes/routes_names.dart';

class CardAttach extends StatelessWidget {
  const CardAttach({Key? key, required this.text, required this.url}) : super(key: key);

  final String text, url;
  @override
  Widget build(BuildContext context) {
    const String _baseUrl = Environment.remoteConexion + 'files/';
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 70.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.black26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                GestureDetector(
                  onTap: () async {
                    Get.toNamed(Routes.preview, arguments: _baseUrl + url);
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    size: 35,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
