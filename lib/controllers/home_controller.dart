import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harman_mebel_olami/data/products_data.dart';

import '../models/product.dart';

class HomeController extends GetxController {
  var currentBannerIndex = 0.obs;

  // Yangi mahsulotlar ro'yxati
  List<Product> get newProducts => ProductsData.getNewProducts();

  final List<Map<String, dynamic>> banners = [
    {
      'badge': 'CHEGIRMA',
      'title': '33% Chegirma',
      'subtitle': 'Barcha yotoqxona mebellari uchun maxsus taklifimiz',
      'accent': 'Faqat bu oyda!',
      'icon': Icons.local_offer,
      'colors': [Color(0xFF667eea), Color(0xFF764ba2)],
    },
    {
      'badge': 'YANGILIK',
      'title': 'Yangi Kolleksiya',
      'subtitle': '2025 yilning eng so\'nggi dizaynlari bilan tanishing',
      'accent': 'Ekskluziv',
      'icon': Icons.auto_awesome,
      'colors': [Color(0xFF00d2ff), Color(0xFF3a7bd5)],
    },
    {
      'badge': 'BEPUL',
      'title': 'Yetkazib Berish',
      'subtitle': '2 million so\'mdan yuqori barcha xaridlar uchun',
      'accent': 'Tez va ishonchli',
      'icon': Icons.local_shipping,
      'colors': [Color(0xFFfa709a), Color(0xFFfee140)],
    },
  ];
}
