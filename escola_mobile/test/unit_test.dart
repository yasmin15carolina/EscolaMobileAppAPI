import 'package:escola_mobile/models/matricula_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MatriculaModel', () {
    test('fromJson() deve converter o JSON em um objeto MatriculaModal', () {
      final Map<String, dynamic> json = {
        'codigo': 1,
        'codigo_curso': 100,
        'codigo_aluno': 200,
        'nome_aluno': 'João',
        'nome_curso': 'Matemática',
      };

      final matricula = MatriculaModel.fromJson(json);

      expect(matricula.codigo, 1);
      expect(matricula.codigoCurso, 100);
      expect(matricula.codigoAluno, 200);
      expect(matricula.nome, 'João');
      expect(matricula.curso, 'Matemática');
    });

    test('toJson() deve converter o objeto MatriculaModal em um JSON', () {
      final matricula = MatriculaModel(
        codigo: 1,
        codigoCurso: 100,
        codigoAluno: 200,
        nome: 'João',
        curso: 'Matemática',
      );

      final json = matricula.toJson();

      expect(json['codigo'], 1);
      expect(json['codigo_curso'], 100);
      expect(json['codigo_aluno'], 200);
      expect(json['nome_aluno'], 'João');
      expect(json['nome_curso'], 'Matemática');
    });
  });
}
