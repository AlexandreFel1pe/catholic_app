import 'package:catholic_app/services/models/capitulo_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'livro_service_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Livro {

  final String nomeLivro;
  final List<Capitulo> capitulo;

  Livro({required this.nomeLivro, required this.capitulo});

  factory Livro.fromJson(Map<String, dynamic> json) => _$LivroFromJson(json);

  Map<String, dynamic> toJson() => _$LivroToJson(this);
}