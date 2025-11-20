import 'package:flutter/material.dart';

class VerseReaderScreen extends StatelessWidget {
  const VerseReaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texto do capitulo'),
      ),
      body: Text('Texto'),
    );
  }
}