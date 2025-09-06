import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../data/products_data.dart';

class CategoryProductsController extends GetxController {
  final Category category;

  CategoryProductsController(this.category);

  // Search
  final searchController = TextEditingController();
  var searchQuery = ''.obs;
  
  // Data
  var allProducts = <Product>[].obs;
  var displayedProducts = <Product>[].obs;
  
  // Filters
  var showOnlyDiscounted = false.obs;
  var showOnlyNew = false.obs;
  var currentSortOption = 'name_asc'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProducts();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _loadProducts() {
    allProducts.value = ProductsData.getProductsByCategory(category.id);
    _applyFiltersAndSort();
  }

  // Search
  void onSearchChanged(String query) {
    searchQuery.value = query;
    _applyFiltersAndSort();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    _applyFiltersAndSort();
  }

  // Filters
  void toggleDiscountFilter(bool value) {
    showOnlyDiscounted.value = value;
    _applyFiltersAndSort();
  }

  void toggleNewFilter(bool value) {
    showOnlyNew.value = value;
    _applyFiltersAndSort();
  }

  void clearFilters() {
    showOnlyDiscounted.value = false;
    showOnlyNew.value = false;
    _applyFiltersAndSort();
  }

  // Sorting
  void onSortChanged(String sortOption) {
    currentSortOption.value = sortOption;
    _applyFiltersAndSort();
  }

  void _applyFiltersAndSort() {
    var products = allProducts.toList();

    // Search filter
    if (searchQuery.value.isNotEmpty) {
      final query = searchQuery.value.toLowerCase();
      products = products.where((product) =>
        product.name.toLowerCase().contains(query) ||
        product.code.toLowerCase().contains(query)
      ).toList();
    }

    // Discount filter
    if (showOnlyDiscounted.value) {
      products = products.where((product) => product.hasDiscount).toList();
    }

    // New filter
    if (showOnlyNew.value) {
      products = products.where((product) => product.isNew).toList();
    }

    // Sorting
    switch (currentSortOption.value) {
      case 'name_asc':
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'name_desc':
        products.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'price_asc':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_desc':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'new_first':
        products.sort((a, b) {
          if (a.isNew && !b.isNew) return -1;
          if (!a.isNew && b.isNew) return 1;
          return a.name.compareTo(b.name); // Secondary sort by name
        });
        break;
    }

    displayedProducts.value = products;
  }

  // Getters
  bool get hasActiveFilters => 
      showOnlyDiscounted.value || 
      showOnlyNew.value || 
      searchQuery.value.isNotEmpty;

  int get totalProductsCount => allProducts.length;
  int get filteredProductsCount => displayedProducts.length;
}