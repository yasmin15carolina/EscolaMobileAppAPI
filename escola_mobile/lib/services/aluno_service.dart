import 'package:dio/dio.dart';
import 'package:escola_mobile/models/aluno_model.dart';
import '../helpers/constantes.dart';

class AlunoService {
  static final Dio dio =
      Dio(); // Você deve criar uma instância única do Dio para reutilização

  static Future<Response> listar() async {
    final res = await dio.get(
      "$urlAPI/Alunos",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return res;
  }

  static Future<Response> cadastrar(AlunoModel aluno) async {
    return dio.post(
      "$urlAPI/Alunos/cadastrar",
      data: aluno.toJson(),
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> atualizar(AlunoModel aluno) async {
    return dio.put(
      "$urlAPI/Alunos/atualizar/${aluno.codigo}",
      data: aluno.toJson(),
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> deletar(int codigo) async {
    return dio.delete(
      "$urlAPI/Alunos/deletar/$codigo",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }
}
