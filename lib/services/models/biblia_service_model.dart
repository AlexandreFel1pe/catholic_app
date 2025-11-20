import 'package:catholic_app/services/models/livro_service_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'biblia_service_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Biblia {
  final String editora;
  final List<Livro> livro;

  Biblia({required this.editora, required this.livro});

  factory Biblia.fromJson(Map<String, dynamic> json) => _$BibliaFromJson(json);

  Map<String, dynamic> toJson() => _$BibliaToJson(this);
}