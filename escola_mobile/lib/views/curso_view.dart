import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/matricula_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:escola_mobile/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    );
  }

  body() {
    return ListView(
      children: [
        SizedBox(height: 25),
        Text(
          widget.curso.descricao,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(widget.curso.ementa),
        SizedBox(height: 25),
        SizedBox(height: 15),
        AspectRatio(aspectRatio: 2, child: buildAlunos())
      ],
    );
  }

  Widget buildAlunos() {
    return Container(
      child: Observer(
        builder: (context) {
          if (matriculaStore.matriculas == null) {
            return CircularProgressIndicator();
          }
          return ListView.separated(
            itemCount: matriculaStore.matriculas!.length,
            separatorBuilder: (context, index) =>
                Divider(height: 1), // Add a Divider between items
            itemBuilder: (context, index) {
              final element = matriculaStore.matriculas![index];
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
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text("ID: ${aluno.codigo}"),
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
                    await matriculaStore.deletarMatricula(matricula.codigo!);
                    Fluttertoast.showToast(
                      msg: 'Aluno Deletado!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
