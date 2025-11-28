import 'package:catholic_app/views/bible/screens/bible_screen.dart';
import 'package:catholic_app/views/bible/screens/book_screen.dart';
import 'package:catholic_app/views/bible/screens/chapter_screen.dart';
import 'package:catholic_app/views/home_page/home_page_screen.dart';
import 'package:catholic_app/views/bible/screens/verse_reader_screen.dart';
import 'package:catholic_app/repositories/biblia_repository.dart';
import 'package:catholic_app/services/biblia_json_service.dart';
import 'package:catholic_app/utils/app_routes.dart';
import 'package:catholic_app/viewmodels/biblia_view_model.dart';
import 'package:catholic_app/views/rosary/screens/rosary_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => BibliaJsonService()),
        Provider(create: (context) => BibliaRepository(bibliaJsonService: context.read())),
        ChangeNotifierProvider(create: (context) => BibliaViewModel(bibliaRepostory: context.read())),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Provider.of<BibliaViewModel>(context, listen: false).getBibleBooks();
  }

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
        AppRoutes.ROSARY: (ctx) => RosaryScreen(),
      },
    );
  }
}