import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog'),
        backgroundColor: Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Catalog Screen - keyinroq to\'ldiriladi'),
      ),
    );
  }
}