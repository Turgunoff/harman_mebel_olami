import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/catalog_controller.dart';
import '../../widgets/category_tile.dart';
import '../../widgets/product_card.dart';
import 'category_products_screen.dart';

class CatalogScreen extends GetView<CatalogController> {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CatalogController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _buildSearchBar(context),
        ),
      ),
      body: Column(
        children: [
          // Tab Bar (Kategoriyalar / Barcha mahsulotlar)
          _buildTabBar(context),

          // Content
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.currentTabIndex.value,
                children: [
                  _buildCategoriesTab(context),
                  _buildAllProductsTab(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: TextField(
        controller: controller.searchController,
        onChanged: controller.onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Mahsulot qidirish...',
          hintStyle: TextStyle(fontFamily: 'Poppins'),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Obx(
            () => controller.searchQuery.value.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: controller.clearSearch,
                  )
                : SizedBox(),
          ),
          filled: true,
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.grey[800]
              : Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[800]
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: controller.currentTabIndex.value == 0
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Kategoriyalar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: controller.currentTabIndex.value == 0
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(1),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: controller.currentTabIndex.value == 1
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'Barcha mahsulotlar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: controller.currentTabIndex.value == 1
                          ? Colors.white
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesTab(BuildContext context) {
    return Obx(() {
      final categories = controller.searchQuery.value.isEmpty
          ? controller.categories
          : controller.filteredCategories;

      if (categories.isEmpty) {
        return _buildEmptyState(context, "Kategoriya topilmadi");
      }

      return ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryTile(
            category: category,
            onTap: () {
              Get.to(() => CategoryProductsScreen(category: category));
            },
          );
        },
      );
    });
  }

  Widget _buildAllProductsTab(BuildContext context) {
    return Obx(() {
      final products = controller.searchQuery.value.isEmpty
          ? controller.allProducts
          : controller.filteredProducts;

      if (products.isEmpty) {
        return _buildEmptyState(
          context,
          controller.searchQuery.value.isEmpty
              ? "Mahsulotlar yo'q"
              : "Mahsulot topilmadi",
        );
      }

      return Column(
        children: [
          // Filter va saralash
          _buildFilterBar(context),

          // Mahsulotlar grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      );
    });
  }

  Widget _buildFilterBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Mahsulotlar soni
          Expanded(
            child: Obx(
              () => Text(
                '${controller.searchQuery.value.isEmpty ? controller.allProducts.length : controller.filteredProducts.length} ta mahsulot',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          // Saralash tugmasi
          PopupMenuButton<String>(
            icon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.sort, size: 20),
                SizedBox(width: 4),
                Text('Saralash', style: TextStyle(fontSize: 14)),
              ],
            ),
            onSelected: controller.onSortChanged,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'name_asc',
                child: Text('Nom bo\'yicha (A-Z)'),
              ),
              PopupMenuItem(
                value: 'name_desc',
                child: Text('Nom bo\'yicha (Z-A)'),
              ),
              PopupMenuItem(
                value: 'price_asc',
                child: Text('Narx bo\'yicha (arzon)'),
              ),
              PopupMenuItem(
                value: 'price_desc',
                child: Text('Narx bo\'yicha (qimmat)'),
              ),
              PopupMenuItem(
                value: 'new_first',
                child: Text('Yangi mahsulotlar'),
              ),
            ],
          ),

          SizedBox(width: 8),

          // Filter tugmasi
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
            SizedBox(height: 16),
            Text(
              message,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.grey[600]),
            ),
            SizedBox(height: 8),
            Text(
              'Boshqa so\'z bilan qidirib ko\'ring',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Filter', style: TextStyle(fontFamily: 'Poppins')),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Kategoriya filter
            ListTile(
              title: Text('Kategoriya'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Get.back();
                _showCategoryFilter(context);
              },
            ),

            // Narx filter
            Obx(
              () => SwitchListTile(
                title: Text('Faqat chegirmali'),
                value: controller.showOnlyDiscounted.value,
                onChanged: controller.toggleDiscountFilter,
              ),
            ),

            Obx(
              () => SwitchListTile(
                title: Text('Faqat yangi'),
                value: controller.showOnlyNew.value,
                onChanged: controller.toggleNewFilter,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller.clearFilters();
              Get.back();
            },
            child: Text('Tozalash'),
          ),
          ElevatedButton(onPressed: () => Get.back(), child: Text('Yopish')),
        ],
      ),
    );
  }

  void _showCategoryFilter(BuildContext context) {
    Get.dialog(
      AlertDialog(
        title: Text('Kategoriya tanlang'),
        content: Container(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return Obx(
                () => CheckboxListTile(
                  title: Text(category.nameUz),
                  value: controller.selectedCategoryIds.contains(category.id),
                  onChanged: (bool? value) {
                    controller.toggleCategoryFilter(category.id);
                  },
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Yopish')),
        ],
      ),
    );
  }
}
