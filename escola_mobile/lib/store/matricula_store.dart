import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/services/matricula_service.dart';
import 'package:mobx/mobx.dart';
part 'matricula_store.g.dart';

class MatriculaStore = _MatriculaStoreBase with _$MatriculaStore;

abstract class _MatriculaStoreBase with Store {
  @observable
  String mensagemErro = "";

  @observable
  ObservableList<MatriculaModel>? matriculas;

  @observable
  MatriculaModel? matricula;

  @action
  Future listarMatriculas() async {
    matriculas = null;
    try {
      final res = await MatriculaService.listar();
      if (res.statusCode == 200) {
        matriculas = ObservableList<MatriculaModel>();
        for (var i = 0; i < res.data.length; i++) {
          matriculas!.add(MatriculaModel.fromJson(res.data[i]));
        }
        matriculas!.asObservable();
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }
}
