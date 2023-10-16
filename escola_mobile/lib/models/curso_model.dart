import 'package:json_annotation/json_annotation.dart';
part 'curso_model.g.dart';

@JsonSerializable()
class CursoModel {
  int? codigo;
  String descricao;
  String ementa;

  CursoModel({this.codigo, required this.descricao, required this.ementa});

  factory CursoModel.fromJson(Map<String, dynamic> json) =>
      _$CursoModelFromJson(json);
  Map<String, dynamic> toJson() => _$CursoModelToJson(this);
}
