import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/matricula_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:escola_mobile/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../matriculas/cadastrar_matricula_view.dart';

class CursoView extends StatefulWidget {
  final CursoModel curso;
  const CursoView({super.key, required this.curso});

  @override
  State<CursoView> createState() => _CursoViewState();
}

class _CursoViewState extends State<CursoView> {
  MatriculaStore matriculaStore = MatriculaStore();
  @override
  void initState() {
    matriculaStore.listarMatriculasdoCurso(widget.curso.codigo!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EscolaAppBar(),
      body: body(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[700],
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CadastrarMatricula(codigoCurso: widget.curso.codigo),
                  ))
              .then((value) =>
                  matriculaStore.listarMatriculasdoCurso(widget.curso.codigo!));
        },
      ),
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const SizedBox(height: 25),
          Text(
            widget.curso.descricao,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            widget.curso.ementa,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          const SizedBox(height: 15),
          AspectRatio(aspectRatio: 2, child: buildAlunos())
        ],
      ),
    );
  }

  Widget buildAlunos() {
    return Container(
      child: Observer(
        builder: (context) {
          if (matriculaStore.matriculas == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: matriculaStore.matriculas!.length,
            separatorBuilder: (context, index) => Divider(height: 1),
            itemBuilder: (context, index) {
              return buildAluno(matriculaStore.matriculas![index]);
            },
          );
        },
      ),
    );
  }

  Widget buildAluno(MatriculaModel matricula) {
    return Container(
      color: const Color.fromARGB(255, 212, 212, 212),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text("${matricula.nome}"),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  EscolaDialogs.deletarMatricula(context, () async {
                    if (await matriculaStore
                        .deletarMatricula(matricula.codigo!)) ;
                    {
                      matriculaStore
                          .listarMatriculasdoCurso(widget.curso.codigo!);
                      Fluttertoast.showToast(
                        msg: 'Matricula Deletada!',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  });
                }),
          ),
        ],
      ),
    );
  }
}
