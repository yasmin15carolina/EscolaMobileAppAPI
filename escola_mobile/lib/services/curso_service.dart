import 'package:dio/dio.dart';
import 'package:escola_mobile/models/curso_model.dart';

import '../helpers/constantes.dart';

class CursoService {
  static Future<Response> listarCursos() async {
    final res = dio.get(
      "$urlAPI/Cursos",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return res;
  }

  static Future<Response> cadastrarCurso(CursoModel curso) async {
    return dio.post(
      "$urlAPI/Cursos/cadastrar",
      data: curso.toJson(),
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> atualizarCurso(CursoModel curso) async {
    return dio.put(
      "$urlAPI/Cursos/atualizar/${curso.codigo}",
      data: curso.toJson(),
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> deletarCurso(int codigo) async {
    return dio.delete(
      "$urlAPI/Cursos/deletar/$codigo",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }
}
