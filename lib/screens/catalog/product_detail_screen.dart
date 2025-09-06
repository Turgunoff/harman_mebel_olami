import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../constants/app_theme.dart';
import '../../models/product.dart';
import '../../controllers/favorites_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favController = Get.put(FavoritesController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Mahsulot ma'lumotlari"),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                favController.isFavorite(product.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favController.isFavorite(product.id) ? Colors.red : null,
              ),
              onPressed: () => favController.toggleFavorite(product),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rasm karuseli
            _buildImageCarousel(),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mahsulot nomi
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  SizedBox(height: 8),

                  // Kod
                  Text(
                    "Mahsulot kodi: ${product.code}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                  ),

                  SizedBox(height: 16),

                  // Narx
                  _buildPriceSection(context),

                  SizedBox(height: 24),

                  // Tavsif
                  _buildDescriptionSection(context),

                  SizedBox(height: 24),

                  // Xususiyatlar
                  _buildFeaturesSection(context),

                  SizedBox(height: 24),

                  // Texnik ma'lumotlar
                  _buildSpecificationsSection(context),

                  SizedBox(height: 32),

                  // Qo'ng'iroq tugmasi
                  _buildCallButton(context),

                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return Container(
      height: 300,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 300,
          viewportFraction: 1.0,
          enableInfiniteScroll: product.images.length > 1,
          autoPlay: product.images.length > 1,
          autoPlayInterval: Duration(seconds: 3),
        ),
        items: product.images.map((imagePath) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[100]),
            child: ClipRRect(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                // Agar rasm topilmasa, placeholder ko'rsatish
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.chair, size: 80, color: Colors.grey[400]),
                        SizedBox(height: 8),
                        Text(
                          'Rasm yuklanmadi',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPriceSection(BuildContext context) {
    return Row(
      children: [
        Text(
          product.formattedPrice,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        if (product.oldPrice != null) ...[
          SizedBox(width: 8),
          Text(
            product.formattedOldPrice,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              decoration: TextDecoration.lineThrough,
              color: Colors.grey[600],
            ),
          ),
        ],
        if (product.discountPercent != null) ...[
          SizedBox(width: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "-${product.discountPercent}%",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Mahsulot haqida",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 12),
        Text(
          product.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
        ),
      ],
    );
  }

  Widget _buildFeaturesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Asosiy xususiyatlari",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 12),
        ...product.features
            .map(
              (feature) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildSpecificationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Texnik ma'lumotlar",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 12),
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: product.specifications.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          entry.key,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 3,
                        child: Text(
                          entry.value,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCallButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        onPressed: () => _makePhoneCall("+998950796972"), // Real raqamingiz
        icon: Icon(Icons.phone, size: 24),
        label: Text(
          "Buyurtma uchun qo'ng'iroq qiling",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  // Action methods
  void _makePhoneCall(String phoneNumber) async {
    try {
      final uri = Uri(scheme: 'tel', path: phoneNumber);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        // Agar to'g'ridan-to'g'ri qo'ng'iroq qilish imkonsiz bo'lsa
        // Dialer'ni ochib raqamni ko'rsatish
        final dialerUri = Uri.parse('tel:$phoneNumber');
        await launchUrl(dialerUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // Fallback - raqamni ko'rsatish
      Get.snackbar(
        'Telefon',
        'Raqam: $phoneNumber\nQo\'lda terish uchun raqamni eslab qoling',
        duration: Duration(seconds: 5),
        backgroundColor: AppTheme.primaryColor,
        colorText: Colors.white,
      );
    }
  }
}
