import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController()); // Controller initialize

    return Scaffold(
      backgroundColor: Color(0xFF00897B),
      body: Center(
        child: AnimatedBuilder(
          animation: controller.animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: controller.fadeAnimation,
              child: ScaleTransition(
                scale: controller.scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo Container
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.chair,
                        size: 60,
                        color: Color(0xFF00897B),
                      ),
                    ),

                    SizedBox(height: 30),

                    Text(
                      'HARMAN',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Mebellar Olami',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                        letterSpacing: 1,
                      ),
                    ),

                    SizedBox(height: 50),

                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 3,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
