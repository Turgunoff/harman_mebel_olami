import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:harman_mebel_olami/constants/app_theme.dart';
import '../../controllers/home_controller.dart';
import '../../data/categories_data.dart';
import '../../widgets/product_card.dart';
import '../catalog/category_products_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Harman Mebellar Olami'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            _buildWelcomeSection(context),

            SizedBox(height: 20),

            // Banner Carousel
            _buildBannerCarousel(),

            SizedBox(height: 30),

            // Categories Section
            _buildCategoriesSection(context),

            SizedBox(height: 30),

            // New Products Section
            _buildNewProductsSection(context),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Theme.of(context).primaryColor,
      //       Theme.of(context).primaryColor.withOpacity(0.8),
      //     ],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //   ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Xush kelibsiz! 👋',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Zamonaviy mebel dunyosini kashf eting',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              // color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220, // 200 dan 220 ga oshirdik
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOutCubic,
            enlargeCenterPage: true,
            viewportFraction: 0.85,
            onPageChanged: (index, reason) {
              controller.currentBannerIndex.value = index;
            },
          ),
          items: controller.banners.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: banner['colors'],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: banner['colors'][0].withOpacity(0.4),
                        blurRadius: 15,
                        offset: Offset(0, 8),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        // Background shapes
                        Positioned(
                          right: -40,
                          top: -40,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.1),
                            ),
                          ),
                        ),
                        Positioned(
                          right: -20,
                          bottom: -20,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.08),
                            ),
                          ),
                        ),

                        // Main icon
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            child: Icon(
                              banner['icon'],
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        // Content - Joy yetishini ta'minlash uchun
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Badge
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  banner['badge'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              SizedBox(height: 8), // 12 dan 8 ga kamaytirildi
                              // Title
                              Text(
                                banner['title'],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20, // 22 dan 20 ga
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(height: 4), // 6 dan 4 ga
                              // Subtitle
                              Flexible(
                                // Flexible qo'shildi
                                child: Text(
                                  banner['subtitle'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12, // 13 dan 12 ga
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white.withOpacity(0.9),
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              SizedBox(height: 6), // 12 dan 6 ga
                              // Accent text
                              if (banner['accent'] != null)
                                Text(
                                  banner['accent'],
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14, // 16 dan 14 ga
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),

        SizedBox(height: 20),

        // Dots indicator
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.banners.asMap().entries.map((entry) {
              bool isActive = controller.currentBannerIndex.value == entry.key;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isActive ? 30 : 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isActive ? AppTheme.primaryColor : Colors.grey[300],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    final categories = CategoriesData.getSortedCategories()
        .take(4)
        .toList(); // Faqat 4 ta

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategoriyalar',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];

              return Card(
                child: InkWell(
                  onTap: () {
                    // Kategoriya mahsulotlarini ko'rsatish
                    Get.to(() => CategoryProductsScreen(category: category));
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          category.iconData,
                          size: 40,
                          color: category.colorValue,
                        ),
                        SizedBox(height: 10),
                        Text(
                          category.nameUz,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNewProductsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yangi mahsulotlar',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            height: 220, // 200 dan 220 ga oshirdik
            child: controller.newProducts.isEmpty
                ? Center(
                    child: Text(
                      'Yangi mahsulotlar yo\'q',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.newProducts.length,
                    itemBuilder: (context, index) {
                      final product = controller.newProducts[index];
                      return ProductCard(product: product, width: 160);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
