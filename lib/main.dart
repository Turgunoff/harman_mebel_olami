import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harman_mebel_olami/constants/app_theme.dart';
import 'screens/splash/splash_screen.dart';
import 'services/storage_service.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Storage service initialize
  await Get.putAsync(() => StorageService().init());

  // Theme controller initialize
  Get.put(ThemeController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Harman Mebellar Olami',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // ThemeController manage qiladi
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
