import 'package:flutter/material.dart';

class BibliaScreen extends StatelessWidget {
  const BibliaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bíblia'),
      ),
      body: Text('Livros'),
    );
  }
}