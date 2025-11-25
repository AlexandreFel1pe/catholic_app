import 'dart:io';

import 'package:catholic_app/models/bibleRouteArgs.dart';
import 'package:catholic_app/utils/app_routes.dart';
import 'package:catholic_app/viewmodels/biblia_view_model.dart';
import 'package:catholic_app/views/bible/widgets/selector_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});

  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<BibliaViewModel>(context, listen: false).getBibleBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bíblia',
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
                horizontal: 35
              ),
              child: GridView.builder(
                itemCount: bible.bibleBooks.length,
                itemBuilder: (ctx, index) => SelectorButton(
                  text: bible.bibleBooks[index].toString(),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.BOOK,
                      arguments: Biblerouteargs(book: bible.bibleBooks[index], chapter: 0, verse: 0),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6/2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 35,
                ),
              ),
            ),
          ),
      ),
    );
  }
}