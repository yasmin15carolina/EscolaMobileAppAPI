import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/matricula_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:escola_mobile/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
    matriculaStore.listarMatriculas();
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
    return Column(
      children: [
        Text(widget.curso.descricao),
        Text(widget.curso.ementa),
        AspectRatio(aspectRatio: 2, child: buildAlunos())
      ],
    );
  }

  Widget buildAlunos() {
    return Container(
      color: Colors.orange,
      child: Observer(
        builder: (context) {
          if (matriculaStore.matriculas == null) {
            return CircularProgressIndicator();
          }
          return ListView.separated(
            itemCount: matriculaStore.matriculas!.length,
            separatorBuilder: (context, index) =>
                Divider(), // Add a Divider between items
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
      margin: EdgeInsets.all(15),
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
                  // EscolaDialogs.deletarAluno(context, () async {
                  //   await matriculaStore.deletarAluno(aluno.codigo!);
                  //   await matriculaStore.listarAlunos();
                  //   Fluttertoast.showToast(
                  //     msg: 'Aluno Deletado!',
                  //     toastLength: Toast.LENGTH_SHORT,
                  //     gravity: ToastGravity.BOTTOM,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: Colors.black,
                  //     textColor: Colors.white,
                  //     fontSize: 16.0,
                  //   );
                  // });
                }),
          ),
        ],
      ),
    );
  }
}
