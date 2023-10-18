import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/alunos_store.dart';
import 'package:escola_mobile/store/cursos_store.dart';
import 'package:escola_mobile/store/matricula_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/aluno_model.dart';

class CadastrarMatricula extends StatefulWidget {
  final int? codigoCurso;
  const CadastrarMatricula({super.key, this.codigoCurso});

  @override
  State<CadastrarMatricula> createState() => _CadastrarMatriculaState();
}

class _CadastrarMatriculaState extends State<CadastrarMatricula> {
  AlunosStore alunosStore = AlunosStore();
  CursosStore cursosStore = CursosStore();
  MatriculaStore matriculaStore = MatriculaStore();

  @override
  void initState() {
    alunosStore.listarAlunos();
    cursosStore.listarCursos();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EscolaAppBar(),
      body: Observer(builder: (context) {
        if (alunosStore.alunos == null) {
          return const Center(child: CircularProgressIndicator());
        }
        if (widget.codigoCurso != null) {
          cursosStore.curso = cursosStore.cursos!
              .firstWhere((element) => element.codigo == widget.codigoCurso);
        }
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              const Text(
                "Cadastrar Matricula",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              dropdownCursos(),
              const SizedBox(height: 20),
              dropdownAlunos(),
              const SizedBox(height: 20),
              buildConfirmarBtn()
            ],
          ),
        );
      }),
    );
  }

  dropdownCursos() {
    return DropdownButtonFormField<CursoModel>(
        hint: Text("Selecione um curso"),
        value: cursosStore.curso,
        onChanged: (CursoModel? newValue) {
          setState(() {
            cursosStore.curso = newValue;
          });
        },
        items: cursosStore.cursos!
            .map<DropdownMenuItem<CursoModel>>((CursoModel curso) {
          return DropdownMenuItem<CursoModel>(
            value: curso,
            child: Text(curso.descricao),
          );
        }).toList(),
        decoration: getDecoration());
  }

  dropdownAlunos() {
    return DropdownButtonFormField<AlunoModel>(
        hint: Text("Selecione um aluno"),
        value: alunosStore.aluno,
        onChanged: (AlunoModel? newValue) {
          setState(() {
            alunosStore.aluno = newValue;
          });
        },
        items: alunosStore.alunos!
            .map<DropdownMenuItem<AlunoModel>>((AlunoModel aluno) {
          return DropdownMenuItem<AlunoModel>(
            value: aluno,
            child: Text(aluno.nome),
          );
        }).toList(),
        decoration: getDecoration());
  }

  buildConfirmarBtn() {
    return InkWell(
      onTap: alunosStore.aluno == null || cursosStore.curso == null
          ? null
          : () async {
              if (await matriculaStore.cadastrarMatricula(
                MatriculaModel(
                    codigoAluno: alunosStore.aluno!.codigo,
                    codigoCurso: cursosStore.curso!.codigo),
              )) {
                Navigator.pop(context);
                Fluttertoast.showToast(
                  msg: 'Matricula Cadastrada!',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              }
            },
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: const Text(
            "Confirmar",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
    );
  }

  getDecoration() {
    return InputDecoration(
      // labelText: "aaa",
      labelStyle: const TextStyle(fontSize: 20),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1, color: Theme.of(context).textTheme.titleSmall!.color!),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
            width: 1, color: Theme.of(context).textTheme.titleSmall!.color!),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
