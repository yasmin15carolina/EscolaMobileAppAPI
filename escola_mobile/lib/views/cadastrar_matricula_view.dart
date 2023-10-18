import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/alunos_store.dart';
import 'package:escola_mobile/store/cursos_store.dart';
import 'package:escola_mobile/store/matricula_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/aluno_model.dart';

class CadastrarMatricula extends StatefulWidget {
  const CadastrarMatricula({super.key});

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
          return Center(child: CircularProgressIndicator());
        }
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text(
              //   'Aluno selecionado:',
              //   style: TextStyle(fontSize: 16),
              // ),
              // Text(
              //   selectedAluno != null
              //       ? selectedAluno!.nome
              //       : 'Nenhum aluno selecionado',
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              Text(
                "Cadastrar Matricula",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<AlunoModel>(
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
                  decoration: getDecoration()),
              SizedBox(height: 20),
              DropdownButtonFormField<CursoModel>(
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
                  decoration: getDecoration()),
              SizedBox(height: 20),

              InkWell(
                onTap: () async {
                  if (await matriculaStore.cadastrarMatricula(
                    MatriculaModel(
                        // nome: alunosStore.aluno!.nome,
                        // curso: cursosStore.curso!.descricao,
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
                      color: Colors.orange,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Confirmar",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              )
            ],
          ),
        );
      }),
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
