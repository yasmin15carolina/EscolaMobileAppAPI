import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/models/matricula_model.dart';
import 'package:escola_mobile/store/cursos_store.dart';
import 'package:escola_mobile/views/cadastrar_matricula_view.dart';
import 'package:escola_mobile/views/curso_view.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:escola_mobile/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../store/matricula_store.dart';

class MatriculasView extends StatefulWidget {
  const MatriculasView({super.key});

  @override
  State<MatriculasView> createState() => _MatriculasViewState();
}

class _MatriculasViewState extends State<MatriculasView> {
  MatriculaStore matriculasStore = MatriculaStore();
  @override
  void initState() {
    matriculasStore.listarMatriculas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: EscolaAppBar(),
      body: Container(
        child: body(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CadastrarMatricula(),
              )).then((value) => matriculasStore.listarMatriculas());
        },
      ),
    );
  }

  body() {
    return Observer(
      builder: (context) {
        if (matriculasStore.matriculas == null) {
          return CircularProgressIndicator();
        }
        return ListView.separated(
          itemCount: matriculasStore.matriculas!.length,
          separatorBuilder: (context, index) =>
              Divider(), // Add a Divider between items
          itemBuilder: (context, index) {
            final element = matriculasStore.matriculas![index];
            return buildMatricula(matriculasStore.matriculas![index]);
          },
        );
      },
    );
  }

  Widget buildMatricula(MatriculaModel matricula) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => CursoView(curso: matricula),
        //     ));
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Curso: ${matricula.curso}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    "Aluno: ${matricula.nome}",
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    EscolaDialogs.deletarMatricula(context, () async {
                      await matriculasStore.deletarMatricula(matricula.codigo!);
                      await matriculasStore.listarMatriculas();
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
