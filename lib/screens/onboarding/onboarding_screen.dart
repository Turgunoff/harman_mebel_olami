import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());
    
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Keng Mebel Katalogi",
            body: "Turli xil mebel mahsulotlarini ko'ring va o'zingizga mos keladiganini tanlang",
            image: _buildImage('assets/images/onboarding1.png'),
            decoration: _getPageDecoration(),
          ),
          PageViewModel(
            title: "Sevimli Mahsulotlar",
            body: "Yoqtirgan mebellaringizni sevimlilar ro'yxatiga qo'shing va keyinroq ko'ring",
            image: _buildImage('assets/images/onboarding2.png'),
            decoration: _getPageDecoration(),
          ),
          PageViewModel(
            title: "Oson Murojaat",
            body: "Bizga telefon orqali bog'laning yoki do'konimizga tashrif buyuring",
            image: _buildImage('assets/images/onboarding3.png'),
            decoration: _getPageDecoration(),
          ),
        ],
        onDone: controller.onDone,
        onSkip: controller.onSkip,
        showSkipButton: true,
        skip: Text("O'tkazib yuborish", style: TextStyle(color: Color(0xFF00897B))),
        next: Icon(Icons.arrow_forward, color: Color(0xFF00897B)),
        done: Text("Boshlash", style: TextStyle(color: Color(0xFF00897B), fontWeight: FontWeight.bold)),
        dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          activeColor: Color(0xFF00897B),
          color: Colors.black26,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Icon(
        Icons.chair, // Vaqtincha icon, keyinroq rasm o'rniga
        size: 200,
        color: Color(0xFF00897B),
      ),
    );
  }

  PageDecoration _getPageDecoration() {
    return PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
        color: Color(0xFF00897B),
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.grey[600],
      ),
      imagePadding: EdgeInsets.zero,
      pageColor: Colors.white,
    );
  }
}