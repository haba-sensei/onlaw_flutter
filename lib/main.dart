import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/routes/routes.dart';
import 'package:onlaw/routes/routes_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Onlaw',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: MyColors.mainColorOrange,
      ),
      initialRoute: Routes.splash,
      getPages: AppPages.appRoutes,
    );
  }
}
