import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/bindings.dart';
import 'constants/route.dart';

void main() async {
  await GetStorage.init("ar_gallery");
  await WidgetsFlutterBinding.ensureInitialized();
  runApp(const OpenLitnerApp());
}

class OpenLitnerApp extends StatelessWidget {
  const OpenLitnerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Litner',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.blue,
          )),
      initialRoute: '/login',
      initialBinding: OpenLitnerBinding(),
      defaultTransition: Transition.cupertino,
      getPages: Routes.page,
    );
  }
}
