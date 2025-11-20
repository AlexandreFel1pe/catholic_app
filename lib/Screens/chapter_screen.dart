import 'package:catholic_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capitulo'),
      ),
      body: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.VERSE_READER);
        },
        child: Text('Versiculos'),
      ),
    );
  }
}