import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  // Onboarding
  bool get isFirstTime => _prefs.getBool('first_time') ?? true;
  Future<void> setFirstTime(bool value) => _prefs.setBool('first_time', value);

  // Dark mode
  bool get isDarkMode => _prefs.getBool('dark_mode') ?? false;
  Future<void> setDarkMode(bool value) => _prefs.setBool('dark_mode', value);

  // Favorites
  List<String> get favorites => _prefs.getStringList('favorites') ?? [];
  Future<void> setFavorites(List<String> list) => _prefs.setStringList('favorites', list);
}