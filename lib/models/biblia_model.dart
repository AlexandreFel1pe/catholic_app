import 'package:catholic_app/services/biblia_json_service.dart';

class Biblia {
  final String editora;
  final List<Livro> livro;

  Biblia({required this.editora, required this.livro});

  Future<void> loadBible() async {
    Biblia bible = (await BibliaJsonService().loadBiblia()) as Biblia;
    print(bible.editora);
  }
}

class Livro {

  final String nomeLivro;
  final List<Capitulo> capitulo;

  Livro({required this.nomeLivro, required this.capitulo});
}

class Capitulo {
  final int numeroCapitulo;
  final List<Versiculo> versiculo;

  Capitulo({required this.numeroCapitulo, required this.versiculo});
}

class Versiculo {
  final int numeroVersiculo;
  final String textoVersiculo;

  Versiculo({required this.numeroVersiculo, required this.textoVersiculo});
}