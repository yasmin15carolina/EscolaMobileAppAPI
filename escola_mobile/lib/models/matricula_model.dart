import 'package:json_annotation/json_annotation.dart';

part 'matricula_model.g.dart';

@JsonSerializable()
class MatriculaModel {
  int? codigo;
  @JsonKey(name: 'codigo_curso')
  int? codigoCurso;
  @JsonKey(name: 'codigo_aluno')
  int? codigoAluno;
  @JsonKey(name: 'nome_aluno')
  String nome;
  @JsonKey(name: 'nome_curso')
  String curso;

  MatriculaModel({
    this.codigo,
    this.codigoCurso,
    this.codigoAluno,
    required this.nome,
    required this.curso,
  });

  factory MatriculaModel.fromJson(Map<String, dynamic> json) =>
      _$MatriculaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MatriculaModelToJson(this);
}
