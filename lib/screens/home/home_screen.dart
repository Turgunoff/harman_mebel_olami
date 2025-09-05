import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asosiy'),
        backgroundColor: Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Home Screen - keyinroq to\'ldiriladi'),
      ),
    );
  }
}