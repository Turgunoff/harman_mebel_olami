class Product {
  final String id;
  final String name;
  final String code;
  final double price;
  final double? oldPrice;
  final int? discountPercent;
  final String category;
  final List<String> images;
  final String description;
  final List<String> features;
  final Map<String, String> specifications;
  final bool isFavorite;
  final bool isNew;
  final bool hasDiscount;

  Product({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    this.oldPrice,
    this.discountPercent,
    required this.category,
    required this.images,
    required this.description,
    required this.features,
    required this.specifications,
    this.isFavorite = false,
    this.isNew = false,
    this.hasDiscount = false,
  });

  // Copy with method (favorites uchun)
  Product copyWith({
    String? id,
    String? name,
    String? code,
    double? price,
    double? oldPrice,
    int? discountPercent,
    String? category,
    List<String>? images,
    String? description,
    List<String>? features,
    Map<String, String>? specifications,
    bool? isFavorite,
    bool? isNew,
    bool? hasDiscount,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      discountPercent: discountPercent ?? this.discountPercent,
      category: category ?? this.category,
      images: images ?? this.images,
      description: description ?? this.description,
      features: features ?? this.features,
      specifications: specifications ?? this.specifications,
      isFavorite: isFavorite ?? this.isFavorite,
      isNew: isNew ?? this.isNew,
      hasDiscount: hasDiscount ?? this.hasDiscount,
    );
  }

  // Narxni formatlash
  String get formattedPrice =>
      "${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so'm";

  String get formattedOldPrice => oldPrice != null
      ? "${oldPrice!.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ')} so'm"
      : "";
}
