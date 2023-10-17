// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matricula_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatriculaModel _$MatriculaModelFromJson(Map<String, dynamic> json) =>
    MatriculaModel(
      codigo: json['codigo'] as int?,
      codigoCurso: json['codigo_curso'] as int?,
      codigoAluno: json['codigo_aluno'] as int?,
      nome: json['nome_aluno'] as String,
      curso: json['nome_curso'] as String,
    );

Map<String, dynamic> _$MatriculaModelToJson(MatriculaModel instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'codigo_curso': instance.codigoCurso,
      'codigo_aluno': instance.codigoAluno,
      'nome_aluno': instance.nome,
      'nome_curso': instance.curso,
    };
