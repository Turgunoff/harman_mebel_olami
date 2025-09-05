import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aloqa'),
        backgroundColor: Color(0xFF00897B),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Contact Screen - keyinroq to\'ldiriladi'),
      ),
    );
  }
}