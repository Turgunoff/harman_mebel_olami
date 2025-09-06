import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String nameUz;
  final String icon; // Icon name yoki path
  final String color; // Hex color code
  final String? image; // Category rasmi (ixtiyoriy)
  final String description;
  final bool isActive;
  final int sortOrder; // Tartib uchun

  Category({
    required this.id,
    required this.name,
    required this.nameUz,
    required this.icon,
    required this.color,
    this.image,
    required this.description,
    this.isActive = true,
    this.sortOrder = 0,
  });

  // Icon widget'ini olish
  IconData get iconData {
    switch (icon) {
      case 'bed':
        return Icons.bed;
      case 'chair':
        return Icons.chair;
      case 'kitchen':
        return Icons.kitchen;
      case 'desk':
        return Icons.desk;
      case 'weekend':
        return Icons.weekend;
      case 'table_restaurant':
        return Icons.table_restaurant;
      default:
        return Icons.category;
    }
  }

  // Rangni Color object'ga aylantirish
  Color get colorValue {
    return Color(int.parse(color.replaceFirst('#', '0xFF')));
  }
}
