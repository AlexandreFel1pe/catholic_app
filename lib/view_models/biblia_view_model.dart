import 'package:catholic_app/repositories/biblia_repository.dart';
import 'package:flutter/material.dart';

class BibliaViewModel with ChangeNotifier {
  BibliaViewModel({required BibliaRepository bibliaRepostory}) : _bibliaRepository = bibliaRepostory {
    loadBooks();
  }

  final BibliaRepository _bibliaRepository;

  List<String> _booksNames = [];
  List<String> get bookNames {
    return _booksNames;
  }

  void loadBooks() async {
    _booksNames = await _bibliaRepository.getBooksNames();

    notifyListeners();
  }
}