import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product.dart';
import '../models/category.dart';
import '../data/products_data.dart';
import '../data/categories_data.dart';

class CatalogController extends GetxController {
  // Tab management
  var currentTabIndex = 0.obs;
  
  // Search
  final searchController = TextEditingController();
  var searchQuery = ''.obs;
  
  // Data
  var categories = <Category>[].obs;
  var allProducts = <Product>[].obs;
  
  // Filtered data
  var filteredCategories = <Category>[].obs;
  var filteredProducts = <Product>[].obs;
  
  // Filters
  var selectedCategoryIds = <String>[].obs;
  var showOnlyDiscounted = false.obs;
  var showOnlyNew = false.obs;
  var currentSortOption = 'name_asc'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void _loadData() {
    categories.value = CategoriesData.getSortedCategories();
    allProducts.value = ProductsData.getAllProducts();
    _applySorting();
  }

  // Tab switching
  void changeTab(int index) {
    currentTabIndex.value = index;
  }

  // Search
  void onSearchChanged(String query) {
    searchQuery.value = query;
    _applyFilters();
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
    _applyFilters();
  }

  // Filtering
  void _applyFilters() {
    // Filter categories
    if (searchQuery.value.isEmpty) {
      filteredCategories.value = categories;
    } else {
      filteredCategories.value = categories.where((category) =>
        category.nameUz.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        category.name.toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList();
    }

    // Filter products
    var products = allProducts.toList();

    // Search filter
    if (searchQuery.value.isNotEmpty) {
      products = products.where((product) =>
        product.name.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
        product.code.toLowerCase().contains(searchQuery.value.toLowerCase())
      ).toList();
    }

    // Category filter
    if (selectedCategoryIds.isNotEmpty) {
      products = products.where((product) =>
        selectedCategoryIds.contains(product.categoryId)
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

    filteredProducts.value = products;
    _applySorting();
  }

  // Sorting
  void onSortChanged(String sortOption) {
    currentSortOption.value = sortOption;
    _applySorting();
  }

  void _applySorting() {
    var products = searchQuery.value.isEmpty ? allProducts.toList() : filteredProducts.toList();

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
          return 0;
        });
        break;
    }

    if (searchQuery.value.isEmpty) {
      allProducts.value = products;
    } else {
      filteredProducts.value = products;
    }
  }

  // Filter toggles
  void toggleCategoryFilter(String categoryId) {
    if (selectedCategoryIds.contains(categoryId)) {
      selectedCategoryIds.remove(categoryId);
    } else {
      selectedCategoryIds.add(categoryId);
    }
    _applyFilters();
  }

  void toggleDiscountFilter(bool value) {
    showOnlyDiscounted.value = value;
    _applyFilters();
  }

  void toggleNewFilter(bool value) {
    showOnlyNew.value = value;
    _applyFilters();
  }

  void clearFilters() {
    selectedCategoryIds.clear();
    showOnlyDiscounted.value = false;
    showOnlyNew.value = false;
    _applyFilters();
  }
}