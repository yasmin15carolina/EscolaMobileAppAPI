import 'package:escola_mobile/models/aluno_model.dart';
import 'package:escola_mobile/services/aluno_service.dart';
import 'package:mobx/mobx.dart';
part 'alunos_store.g.dart';

class AlunosStore = _AlunosStoreBase with _$AlunosStore;

abstract class _AlunosStoreBase with Store {
  @observable
  String mensagemErro = "";

  @observable
  ObservableList<AlunoModel>? alunos;

  @observable
  AlunoModel? aluno;

  @action
  Future listarAlunos() async {
    alunos = null;
    try {
      final res = await AlunoService.listar();
      if (res.statusCode == 200) {
        alunos = ObservableList<AlunoModel>();
        for (var i = 0; i < res.data.length; i++) {
          alunos!.add(AlunoModel.fromJson(res.data[i]));
        }
        alunos!.asObservable();
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }

  @action
  Future cadastrarAluno() async {
    try {
      final res = await AlunoService.cadastrar(aluno!);
      if (res.statusCode == 201) {
        print(res.data);
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }

  @action
  Future atualizarAluno() async {
    try {
      final res = await AlunoService.atualizar(aluno!);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }

  @action
  Future deletarAluno(int codigo) async {
    try {
      final res = await AlunoService.deletar(codigo);
      if (res.statusCode == 200) {
        print(res.data);
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }
}
