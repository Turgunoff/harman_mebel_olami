import '../models/category.dart';

class CategoriesData {
  static List<Category> getAllCategories() {
    return [
      Category(
        id: "yotoqxona",
        name: "Спальня",
        nameUz: "Yotoqxona",
        icon: "bed",
        color: "#3F51B5",
        description: "Yotoqxona uchun barcha turdagi mebellar",
        sortOrder: 1,
      ),

      Category(
        id: "zal",
        name: "Гостиная",
        nameUz: "Zal",
        icon: "chair",
        color: "#4CAF50",
        description: "Mehmon zalida va yashash xonasi uchun mebellar",
        sortOrder: 2,
      ),

      Category(
        id: "oshxona",
        name: "Кухня",
        nameUz: "Oshxona",
        icon: "kitchen",
        color: "#FF9800",
        description: "Oshxona va ovqat tayyorlash zonasi uchun",
        sortOrder: 3,
      ),

      Category(
        id: "ofis",
        name: "Офис",
        nameUz: "Ofis",
        icon: "desk",
        color: "#9C27B0",
        description: "Ish joyi va ofis uchun mebel",
        sortOrder: 4,
      ),

      Category(
        id: "bolalar",
        name: "Детская",
        nameUz: "Bolalar xonasi",
        icon: "weekend",
        color: "#E91E63",
        description: "Bolalar uchun xavfsiz va chiroyli mebel",
        sortOrder: 5,
      ),

      Category(
        id: "ovqat_xonasi",
        name: "Столовая",
        nameUz: "Ovqat xonasi",
        icon: "table_restaurant",
        color: "#795548",
        description: "Ovqatlanish zonasi uchun stol va stullar",
        sortOrder: 6,
      ),
    ];
  }

  // Faol kategoriyalar
  static List<Category> getActiveCategories() {
    return getAllCategories().where((category) => category.isActive).toList();
  }

  // ID bo'yicha kategoriya
  static Category? getCategoryById(String id) {
    try {
      return getAllCategories().firstWhere((category) => category.id == id);
    } catch (e) {
      return null;
    }
  }

  // Tartib bo'yicha saralangan
  static List<Category> getSortedCategories() {
    final categories = getActiveCategories();
    categories.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return categories;
  }
}
