import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/main_controller.dart';
import '../home/home_screen.dart';
import '../catalog/catalog_screen.dart';
import '../favorites/favorites_screen.dart';
import '../contact/contact_screen.dart';

class MainScreen extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          HomeScreen(),     // 0 - Asosiy
          CatalogScreen(),  // 1 - Katalog  
          FavoritesScreen(), // 2 - Sevimlilar
          ContactScreen(),  // 3 - Aloqa
        ],
      )),
      
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF00897B),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Sevimlilar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'Aloqa',
          ),
        ],
      )),
    );
  }
}