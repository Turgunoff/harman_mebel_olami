import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../services/storage_service.dart';
import '../data/products_data.dart';

class FavoritesController extends GetxController {
  var favoriteIds = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void _loadFavorites() {
    final storage = StorageService.to;
    favoriteIds.value = storage.favorites;
  }

  void _saveFavorites() {
    final storage = StorageService.to;
    storage.setFavorites(favoriteIds);
  }

  bool isFavorite(String productId) {
    return favoriteIds.contains(productId);
  }

  void toggleFavorite(Product product) {
    if (isFavorite(product.id)) {
      favoriteIds.remove(product.id);
      Get.snackbar(
        "Sevimlilar",
        "Mahsulot sevimlilardan olib tashlandi",
        backgroundColor: Colors.grey[600],
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    } else {
      favoriteIds.add(product.id);
      Get.snackbar(
        "Sevimlilar",
        "Mahsulot sevimlilarga qo'shildi",
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
    }
    _saveFavorites();
  }

  void clearAllFavorites() {
    favoriteIds.clear();
    _saveFavorites();
    Get.snackbar(
      "Sevimlilar",
      "Barcha mahsulotlar o'chirildi",
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

  // Sevimli mahsulotlarni olish
  List<Product> get favoriteProducts {
    final allProducts = ProductsData.getAllProducts();
    return allProducts
        .where((product) => favoriteIds.contains(product.id))
        .toList();
  }

  List<String> get favorites => favoriteIds;
}
