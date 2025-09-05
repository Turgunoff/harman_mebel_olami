import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../screens/main/main_screen.dart';

class OnboardingController extends GetxController {
  
  void onDone() {
    _finishOnboarding();
  }
  
  void onSkip() {
    _finishOnboarding();
  }
  
  void _finishOnboarding() async {
    final storage = StorageService.to;
    await storage.setFirstTime(false);
    Get.offAll(() => MainScreen());
  }
}