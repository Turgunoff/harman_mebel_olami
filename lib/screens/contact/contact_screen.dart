import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/theme_controller.dart';

class ContactScreen extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController()); // Agar initialize bo'lmagan bo'lsa

    return Scaffold(
      appBar: AppBar(title: Text('Aloqa')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dark Mode Toggle
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.dark_mode,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Tungi rejim',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Obx(
                      () => Switch(
                        value: controller.isDarkMode.value,
                        onChanged: (value) => controller.toggleTheme(),
                        activeColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Contact info - keyinroq to'ldiriladi
            Text(
              'Aloqa ma\'lumotlari keyinroq qo\'shiladi',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
