import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../constants/app_theme.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromStorage();
  }

  void _loadThemeFromStorage() {
    final storage = StorageService.to;
    isDarkMode.value = storage.isDarkMode;
    _updateTheme();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _updateTheme();
    _saveThemeToStorage();
  }

  void _updateTheme() {
    Get.changeTheme(
      isDarkMode.value ? AppTheme.darkTheme : AppTheme.lightTheme,
    );
  }

  void _saveThemeToStorage() {
    final storage = StorageService.to;
    storage.setDarkMode(isDarkMode.value);
  }
}
