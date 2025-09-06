import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/favorites_controller.dart';
import '../../data/products_data.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';
import '../catalog/product_detail_screen.dart';

class FavoritesScreen extends GetView<FavoritesController> {
  @override
  Widget build(BuildContext context) {
    Get.put(FavoritesController()); // Controller'ni initialize qilish
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Sevimlilar'),
        actions: [
          Obx(() => controller.favoriteProducts.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear_all),
                  onPressed: () => _showClearDialog(context),
                )
              : SizedBox()),
        ],
      ),
      body: Obx(() {
        if (controller.favoriteProducts.isEmpty) {
          return _buildEmptyState(context);
        }
        
        return _buildFavoritesList(context);
      }),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 60,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'Sevimlilar ro\'yxati bo\'sh',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 12),
            
            Text(
              'Yoqtirgan mahsulotlaringizni sevimlilar ro\'yxatiga qo\'shing va keyinroq oson toping',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 32),
            
            ElevatedButton.icon(
              onPressed: () {
                // Katalog sahifasiga o'tish
                Get.snackbar(
                  "Katalog",
                  "Katalog sahifasi keyinroq qo'shiladi",
                  backgroundColor: Theme.of(context).primaryColor,
                  colorText: Colors.white,
                );
              },
              icon: Icon(Icons.shopping_bag),
              label: Text(
                'Mahsulotlarni ko\'rish',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoritesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header ma'lumot
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(width: 8),
              Obx(() => Text(
                '${controller.favoriteProducts.length} ta mahsulot',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )),
            ],
          ),
        ),
        
        // Mahsulotlar ro'yxati
        Expanded(
          child: Obx(() => GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7, // Card proportion
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: controller.favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = controller.favoriteProducts[index];
              return _buildFavoriteCard(context, product);
            },
          )),
        ),
      ],
    );
  }

  Widget _buildFavoriteCard(BuildContext context, Product product) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {
          Get.to(() => ProductDetailScreen(product: product));
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rasm va favorite button
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
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[100],
                            child: Icon(
                              Icons.chair,
                              size: 50,
                              color: Theme.of(context).primaryColor.withOpacity(0.7),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Badges
                  if (product.hasDiscount)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                  
                  if (product.isNew)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                  
                  // Favorite button
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => controller.toggleFavorite(product),
                      child: Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.red,
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
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Mahsulot nomi
                    Expanded(
                      child: Text(
                        product.name,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    SizedBox(height: 8),
                    
                    // Narx
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Barchasini o\'chirish',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        content: Text(
          'Sevimlilar ro\'yxatidagi barcha mahsulotlarni o\'chirishni xohlaysizmi?',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'Bekor qilish',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.grey[600],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.clearAllFavorites();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              'O\'chirish',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}