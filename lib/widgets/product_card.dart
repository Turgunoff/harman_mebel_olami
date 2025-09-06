import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/favorites_controller.dart';
import '../models/product.dart';
import '../screens/catalog/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double? width;
  final bool showDiscount;

  const ProductCard({
    super.key,
    required this.product,
    this.width,
    this.showDiscount = true,
  });

  @override
  Widget build(BuildContext context) {
    final favController = Get.put(FavoritesController());

    return Container(
      width: width ?? 160,
      margin: EdgeInsets.only(right: 15),
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: () {
            Get.to(() => ProductDetailScreen(product: product));
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rasm va badge'lar
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    // Mahsulot rasmi
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          product.images.isNotEmpty ? product.images.first : '',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          // Agar rasm topilmasa
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[100],
                              child: Icon(
                                Icons.chair,
                                size: 50,
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.7),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    // Chegirma badge
                    if (product.hasDiscount && showDiscount)
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "-${product.discountPercent}%",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    // Yangi badge
                    if (product.isNew)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "YANGI",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    // Sevimlilar tugmasi
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Obx(
                        () => GestureDetector(
                          onTap: () => favController.toggleFavorite(product),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              favController.isFavorite(product.id)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 16,
                              color: favController.isFavorite(product.id)
                                  ? Colors.red
                                  : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Mahsulot ma'lumotlari
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Mahsulot nomi
                      Expanded(
                        child: Text(
                          product.name,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      SizedBox(height: 4),

                      // Narx qismi
                      if (product.hasDiscount && product.oldPrice != null) ...[
                        Text(
                          product.formattedOldPrice,
                          style: TextStyle(
                            fontSize: 11,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[500],
                          ),
                        ),
                        SizedBox(height: 2),
                      ],

                      Text(
                        product.formattedPrice,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
