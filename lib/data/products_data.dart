import '../models/product.dart';
import 'categories_data.dart';

class ProductsData {
  static List<Product> getAllProducts() {
    return [
      Product(
        id: "1",
        name:
            "Yotoq o'rni ko'tariluvchi mexanizm bilan \"Samarqand\" Olcha / Qora",
        code: "HRM2024",
        price: 3500000, // 3,500,000 so'm
        oldPrice: 5250000, // 5,250,000 so'm
        discountPercent: 33,
        categoryId: "yotoqxona",
        hasDiscount: true,
        isNew: true,
        images: [
          "assets/images/products/yotoq_samarqand_1.jpg",
          "assets/images/products/yotoq_samarqand_2.jpg",
          "assets/images/products/yotoq_samarqand_3.jpg",
        ],
        description: """
"Samarqand" yotoq o'rni zamonaviy uslubda ishlab chiqarilgan bo'lib, har qanday yotoqxona interieriga mukammal mos keladi. Yumshoq bosh tayanch velur mato bilan qoplangan bo'lib, kitob o'qish yoki televizor ko'rish uchun maksimal qulaylik yaratadi.

Yotoq tagida keng saqlash joyi mavjud bo'lib, choyshablar, yostiqlar va boshqa narsalarni saqlash uchun ishlatiladi. Ko'tariluvchi mexanizm zamonaviy va ishonchli bo'lib, uzun yillar xizmat qiladi.

Ramka yuqori sifatli LDSTP materialidan tayyorlangan. Bosh tayanch mikrovelur mato bilan qoplangan bo'lib, 60,000 dan ortiq ishqalanish sikllariga bardosh beradi.

**Muhim:** Matras to'plamga kirmaydi va alohida sotib olinadi.
  """,
        features: [
          "Zamonaviy dizayn - amaliy materiallar va chiroyli shakl",
          "Yumshoq velur bosh tayanch maksimal qulaylik uchun",
          "Ko'tariluvchi mexanizm to'plamda",
          "Keng saqlash joyi choyshablar uchun",
          "Qoplama 60,000 dan ortiq ishqalanishga chidamli",
          "Bir kishi uchun 150 kg gacha yuk",
        ],
        specifications: {
          "Mahsulot kodi": "HRM.2024.01",
          "O'lchamlari (B x E x Ch)": "101,5 x 167,1 x 215,5 sm",
          "Yotoq o'lchami": "160 x 200 sm",
          "Turi": "Ikki kishilik yotoq",
          "Ishlab chiqaruvchi mamlakat": "O'zbekiston",
          "Uslub": "Zamonaviy",
          "Rang": "Olcha / Qora",
          "Ramka materiali": "LDSTP 16, 32 mm",
          "Qoplama materiali": "Mikrovelur (100% poliester)",
          "Qoplama zichligi": "420 g/m²",
          "Yuk ko'tarish": "150 kg gacha",
          "Kafolat": "18 oy",
          "Kolleksiya": "Samarqand",
          "Ishlab chiqaruvchi": "Harman Group MCHJ",
        },
      ),
      // Qolgan 7 ta ham shunga o'xshash...
    ];
  }

  // Kategoriya bo'yicha filter - YANGI!
  static List<Product> getProductsByCategory(String categoryId) {
    return getAllProducts()
        .where((product) => product.categoryId == categoryId)
        .toList();
  }

  // Kategoriya nomi bo'yicha
  static List<Product> getProductsByCategoryName(String categoryName) {
    final category = CategoriesData.getAllCategories().firstWhere(
      (cat) => cat.nameUz == categoryName || cat.name == categoryName,
    );
    return getProductsByCategory(category.id);
  }

  // Yangi mahsulotlar
  static List<Product> getNewProducts() {
    return getAllProducts().where((product) => product.isNew).toList();
  }

  // Chegirmali mahsulotlar
  static List<Product> getDiscountedProducts() {
    return getAllProducts().where((product) => product.hasDiscount).toList();
  }

  // Qidiruv - umumiy
  static List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return getAllProducts()
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowercaseQuery) ||
              product.code.toLowerCase().contains(lowercaseQuery) ||
              (product.category?.nameUz.toLowerCase().contains(
                    lowercaseQuery,
                  ) ??
                  false),
        )
        .toList();
  }

  // Kategoriya ichida qidiruv
  static List<Product> searchInCategory(String categoryId, String query) {
    final categoryProducts = getProductsByCategory(categoryId);
    final lowercaseQuery = query.toLowerCase();
    return categoryProducts
        .where(
          (product) =>
              product.name.toLowerCase().contains(lowercaseQuery) ||
              product.code.toLowerCase().contains(lowercaseQuery),
        )
        .toList();
  }
}
