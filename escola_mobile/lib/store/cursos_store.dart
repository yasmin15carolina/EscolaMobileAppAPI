import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/services/curso_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'cursos_store.g.dart';

class CursosStore = _CursosStoreBase with _$CursosStore;

abstract class _CursosStoreBase with Store {
  @observable
  String mensagemErro = "";

  @observable
  ObservableList<CursoModel>? cursos;

  @observable
  CursoModel? curso;

  @action
  Future listarCursos() async {
    cursos = null;
    try {
      final res = await CursoService.listarCursos();
      if (res.statusCode == 200) {
        cursos = ObservableList<CursoModel>();
        for (var i = 0; i < res.data.length; i++) {
          cursos!.add(CursoModel.fromJson(res.data[i]));
        }
        cursos!.asObservable();
      } else {
        mensagemErro = res.data['mensagem'];
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }

  @action
  Future cadastrarCurso() async {
    try {
      final res = await CursoService.cadastrarCurso(curso!);
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
  Future atualizarCurso() async {
    try {
      final res = await CursoService.atualizarCurso(curso!);
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
  Future deletarCurso(int codigo) async {
    try {
      final res = await CursoService.deletarCurso(codigo);
      if (res.statusCode == 200) {
        print(res.data);
        Fluttertoast.showToast(
          msg: 'Curso Deletado!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } else {
        mensagemErro = res.data['error'];
        print(res.data);
        Fluttertoast.showToast(
          msg: mensagemErro,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      mensagemErro = "Erro ao Recuperar informações";
    }
  }
}
