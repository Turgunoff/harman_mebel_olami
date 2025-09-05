import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/storage_service.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/main/main_screen.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void onInit() {
    super.onInit();
    _setupAnimations();
    _navigateToNext();
  }

  void _setupAnimations() {
    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticOut),
    );

    animationController.forward();
  }

  void _navigateToNext() async {
    await Future.delayed(Duration(seconds: 3));

    final storage = StorageService.to;

    if (storage.isFirstTime) {
      Get.off(() => OnboardingScreen());
    } else {
      Get.off(() => MainScreen());
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
