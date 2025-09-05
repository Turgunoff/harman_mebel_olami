import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sevimlilar'),
        backgroundColor: Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Favorites Screen - keyinroq to\'ldiriladi'),
      ),
    );
  }
}