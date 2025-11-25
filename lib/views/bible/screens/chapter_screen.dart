import 'dart:io';

import 'package:catholic_app/models/bibleRouteArgs.dart';
import 'package:catholic_app/utils/app_routes.dart';
import 'package:catholic_app/viewmodels/biblia_view_model.dart';
import 'package:catholic_app/views/bible/widgets/selector_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChapterScreen extends StatefulWidget {
  const ChapterScreen({super.key});

  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  late Biblerouteargs biblerouteargs = Biblerouteargs(book: '', chapter: 0, verse: 0);
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        biblerouteargs = ModalRoute.of(context)?.settings.arguments as Biblerouteargs;
      });

      final bible = Provider.of<BibliaViewModel>(context, listen: false);
      bible.getChapterVerses(biblerouteargs.book, biblerouteargs.chapter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${biblerouteargs.book} ${biblerouteargs.chapter}',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      body: Consumer<BibliaViewModel>(
        builder: (context, bible, child) =>
        Center(
            child: Container(
              width: Platform.isWindows ? 400 : double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 5,
              ),
              child: GridView.builder(
                itemCount: bible.chapterVerses.length,
                itemBuilder: (ctx, index) => SelectorButton(
                  text: bible.chapterVerses[index].toString(),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.VERSE_READER,
                      arguments: Biblerouteargs(book: biblerouteargs.book, chapter: biblerouteargs.chapter, verse: bible.chapterVerses[index]),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 6/4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
              ),
            ),
          ),
      ),
    );
  }
}