import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash/splash_screen.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Storage service initialize
  await Get.putAsync(() => StorageService().init());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Harman Mebellar Olami',
      theme: ThemeData(primarySwatch: Colors.teal, useMaterial3: true),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
