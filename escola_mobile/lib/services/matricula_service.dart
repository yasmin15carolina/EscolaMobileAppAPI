import 'package:dio/dio.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import '../helpers/constantes.dart';

class MatriculaService {
  static Future<Response> listar() async {
    final res = await dio.get(
      "$urlAPI/Matricula",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    return res;
  }

  static Future<Response> cadastrar(MatriculaModel matricula) async {
    return dio.post(
      "$urlAPI/Matricula/cadastrar",
      data: matricula.toJson(),
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

  static Future<Response> deletar(int codigo) async {
    return dio.delete(
      "$urlAPI/Matricula/remover/$codigo",
      options: Options(
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }
}
