import 'package:catholic_app/Screens/bible_screen.dart';
import 'package:catholic_app/Screens/book_screen.dart';
import 'package:catholic_app/Screens/chapter_screen.dart';
import 'package:catholic_app/Screens/home_page_screen.dart';
import 'package:catholic_app/Screens/verse_reader_screen.dart';
import 'package:catholic_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catholic App',
      theme: ThemeData(
        
      ),
      routes: {
        AppRoutes.HOMEPAGE: (ctx) => HomePageScreen(),
        AppRoutes.BIBLIA: (ctx) => BibleScreen(),
        AppRoutes.BOOK: (ctx) => BookScreen(),
        AppRoutes.CHAPTER: (ctx) => ChapterScreen(),
        AppRoutes.VERSE_READER: (ctx) => VerseReaderScreen(),
      },
    );
  }
}