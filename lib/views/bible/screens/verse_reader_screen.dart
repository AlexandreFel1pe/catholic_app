import 'dart:async';
import 'dart:io';

import 'package:catholic_app/models/bibleRouteArgs.dart';
import 'package:catholic_app/viewmodels/biblia_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class VerseReaderScreen extends StatefulWidget {
  const VerseReaderScreen({super.key});

  @override
  State<VerseReaderScreen> createState() => _VerseReaderScreenState();
}

class _VerseReaderScreenState extends State<VerseReaderScreen> {
  late Biblerouteargs biblerouteargs = Biblerouteargs(book: '', chapter: 0, verse: 0);
  final ItemScrollController _itemScrollController = ItemScrollController();
  
  Color? _animatedColor;
  Timer? _timer;
  int fontSize = 16;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();

      _scrollToIndex(biblerouteargs.verse);

      animateSelectedVerse();
    });
  }

  void loadData() {
    setState(() {
        biblerouteargs = ModalRoute.of(context)?.settings.arguments as Biblerouteargs;
      });
      
      final bible = Provider.of<BibliaViewModel>(context, listen: false);
      bible.getChapterVersesText(biblerouteargs.book, biblerouteargs.chapter);
  }

  void _scrollToIndex(int index) {
    Future.delayed(const Duration(milliseconds: 200), () {
      _itemScrollController.scrollTo(
        index: index - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void animateSelectedVerse() {
    setState(() {
      _animatedColor = Colors.blueGrey[100];
      fontSize = 22;
    });

    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _animatedColor = Colors.white;
        fontSize = 16;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${biblerouteargs.book} ${biblerouteargs.chapter},${biblerouteargs.verse}',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      body: Consumer<BibliaViewModel>(
        builder: (context, bible, child) =>
          ScrollablePositionedList.builder(
            padding: EdgeInsets.only(
              top: 10,
              bottom: 30,
            ),
            itemScrollController: _itemScrollController,
            itemCount: bible.versiculos.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.only(
                left: 10,
                right: Platform.isWindows ? 10 : 0,
              ),
              margin: EdgeInsets.only(
                right: Platform.isWindows ? 12 : 0,
                bottom: 10,
              ),
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceOut,
                color: index == biblerouteargs.verse - 1 ? _animatedColor : null,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${bible.versiculos[index].numeroVersiculo.toString()} ',
                        style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: bible.versiculos[index].textoVersiculo,
                        style: const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ),
    );
  }
}