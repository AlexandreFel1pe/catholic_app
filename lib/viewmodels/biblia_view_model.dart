import 'package:catholic_app/repositories/biblia_repository.dart';
import 'package:catholic_app/services/models/versiculo_service_model.dart';
import 'package:flutter/material.dart';

class BibliaViewModel with ChangeNotifier {
  BibliaViewModel({required BibliaRepository bibliaRepostory}) : _bibliaRepository = bibliaRepostory {
    //getBibleBooks();
  }

  final BibliaRepository _bibliaRepository;

  List<String> _bibleBooks = [];

  List<String> get bibleBooks {
    return _bibleBooks;
  }

  List<int> _bookChapters = [];
  
  List<int> get bookChapters {
    return _bookChapters;
  }

  List<int> _chapterVerses = [];
  
  List<int> get chapterVerses {
    return _chapterVerses;
  }

  List<Versiculo> _versciulos = [];

  List<Versiculo> get versiculos {
    return _versciulos;
  }

  void getBibleBooks() async {
    _bibleBooks = await _bibliaRepository.getBooksNames();

    notifyListeners();
  }

  void getBookChapters(String book) async {
    _bookChapters = await _bibliaRepository.getChapters(book);

    notifyListeners();
  }

  void getChapterVerses(String book, int chapter) async {
    _chapterVerses = await _bibliaRepository.getVerses(book, chapter);

    notifyListeners();
  }

  void getChapterVersesText(String book, int chapter) async {
    _versciulos = await _bibliaRepository.getVersesText(book, chapter);

    notifyListeners();
  }
}