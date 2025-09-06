import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/category_products_controller.dart';
import '../../models/category.dart';
import '../../widgets/product_card.dart';

class CategoryProductsScreen extends StatelessWidget {
  final Category category;

  const CategoryProductsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryProductsController(category));
    
    return Scaffold(
      appBar: AppBar(
        title: Text(category.nameUz),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: _buildSearchBar(context, controller),
        ),
      ),
      body: Column(
        children: [
          // Category info header
          _buildCategoryHeader(context),
          
          // Filter va saralash bar
          _buildFilterBar(context, controller),
          
          // Mahsulotlar grid
          Expanded(
            child: Obx(() => _buildProductsGrid(context, controller)),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context, CategoryProductsController controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: TextField(
        controller: controller.searchController,
        onChanged: controller.onSearchChanged,
        decoration: InputDecoration(
          hintText: '${category.nameUz} ichida qidirish...',
          hintStyle: TextStyle(fontFamily: 'Poppins'),
          prefixIcon: Icon(Icons.search),
          suffixIcon: Obx(() => controller.searchQuery.value.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: controller.clearSearch,
                )
              : SizedBox()),
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

  Widget _buildCategoryHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.colorValue,
            category.colorValue.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: category.colorValue.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Category icon
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              category.iconData,
              size: 32,
              color: Colors.white,
            ),
          ),
          
          SizedBox(width: 16),
          
          // Category info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.nameUz,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  category.description,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context, CategoryProductsController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Mahsulotlar soni
          Expanded(
            child: Obx(() => Text(
              '${controller.displayedProducts.length} ta mahsulot',
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
          
          // Filter tugmalari
          _buildFilterChips(context, controller),
          
          SizedBox(width: 8),
          
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
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha, size: 20),
                    SizedBox(width: 8),
                    Text('Nom (A-Z)'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'name_desc',
                child: Row(
                  children: [
                    Icon(Icons.sort_by_alpha, size: 20),
                    SizedBox(width: 8),
                    Text('Nom (Z-A)'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'price_asc',
                child: Row(
                  children: [
                    Icon(Icons.trending_up, size: 20),
                    SizedBox(width: 8),
                    Text('Narx (arzon)'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'price_desc',
                child: Row(
                  children: [
                    Icon(Icons.trending_down, size: 20),
                    SizedBox(width: 8),
                    Text('Narx (qimmat)'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'new_first',
                child: Row(
                  children: [
                    Icon(Icons.new_releases, size: 20),
                    SizedBox(width: 8),
                    Text('Yangi avval'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context, CategoryProductsController controller) {
    return Row(
      children: [
        // Chegirma filter
        Obx(() => FilterChip(
          label: Text(
            'Chegirma',
            style: TextStyle(fontSize: 12),
          ),
          selected: controller.showOnlyDiscounted.value,
          onSelected: controller.toggleDiscountFilter,
          selectedColor: Colors.red.withOpacity(0.2),
          checkmarkColor: Colors.red,
        )),
        
        SizedBox(width: 8),
        
        // Yangi filter
        Obx(() => FilterChip(
          label: Text(
            'Yangi',
            style: TextStyle(fontSize: 12),
          ),
          selected: controller.showOnlyNew.value,
          onSelected: controller.toggleNewFilter,
          selectedColor: Colors.green.withOpacity(0.2),
          checkmarkColor: Colors.green,
        )),
      ],
    );
  }

  Widget _buildProductsGrid(BuildContext context, CategoryProductsController controller) {
    final products = controller.displayedProducts;
    
    if (products.isEmpty) {
      return _buildEmptyState(context, controller);
    }

    return GridView.builder(
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
    );
  }

  Widget _buildEmptyState(BuildContext context, CategoryProductsController controller) {
    String message;
    String subtitle;
    
    if (controller.searchQuery.value.isNotEmpty) {
      message = 'Mahsulot topilmadi';
      subtitle = '"${controller.searchQuery.value}" uchun natija yo\'q';
    } else if (controller.showOnlyDiscounted.value || controller.showOnlyNew.value) {
      message = 'Filter bo\'yicha mahsulot yo\'q';
      subtitle = 'Filter parametrlarini o\'zgartiring';
    } else {
      message = 'Bu kategoriyada mahsulot yo\'q';
      subtitle = 'Tez orada yangi mahsulotlar qo\'shiladi';
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: category.colorValue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                controller.searchQuery.value.isNotEmpty 
                    ? Icons.search_off
                    : category.iconData,
                size: 50,
                color: category.colorValue.withOpacity(0.5),
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              message,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 8),
            
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            
            SizedBox(height: 24),
            
            // Action buttons
            if (controller.searchQuery.value.isNotEmpty || 
                controller.showOnlyDiscounted.value || 
                controller.showOnlyNew.value)
              ElevatedButton.icon(
                onPressed: () {
                  controller.clearSearch();
                  controller.clearFilters();
                },
                icon: Icon(Icons.clear_all),
                label: Text(
                  'Filtrni tozalash',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: category.colorValue,
                ),
              ),
          ],
        ),
      ),
    );
  }
}