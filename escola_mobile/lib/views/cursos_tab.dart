import 'package:escola_mobile/models/curso_model.dart';
import 'package:escola_mobile/store/cursos_store.dart';
import 'package:escola_mobile/views/curso_view.dart';
import 'package:escola_mobile/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CursosTab extends StatefulWidget {
  const CursosTab({super.key});

  @override
  State<CursosTab> createState() => _CursosTabState();
}

class _CursosTabState extends State<CursosTab> {
  CursosStore cursosStore = CursosStore();
  @override
  void initState() {
    cursosStore.listarCursos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
      ),
      body: Container(
        child: body(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          EscolaDialogs.cadastrarCurso(context,
              (String descricao, String ementa) async {
            cursosStore.curso =
                CursoModel(descricao: descricao, ementa: ementa);
            await cursosStore.cadastrarCurso();
            await cursosStore.listarCursos();
          });
        },
      ),
    );
  }

  body() {
    return Observer(
      builder: (context) {
        if (cursosStore.cursos == null) {
          return CircularProgressIndicator();
        }
        return ListView.separated(
          itemCount: cursosStore.cursos!.length,
          separatorBuilder: (context, index) =>
              Divider(), // Add a Divider between items
          itemBuilder: (context, index) {
            final element = cursosStore.cursos![index];
            return buildAluno(cursosStore.cursos![index]);
          },
        );
      },
    );
  }

  Widget buildAluno(CursoModel curso) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CursoView(curso: curso),
            ));
      },
      child: Container(
        margin: EdgeInsets.all(15),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Curso: ${curso.descricao}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Ementa: ${curso.ementa}"),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    EscolaDialogs.atualizarCurso(
                        context, curso.descricao, curso.ementa,
                        (String descricao, String ementa) async {
                      cursosStore.curso = curso;
                      cursosStore.curso!.descricao = descricao;
                      cursosStore.curso!.ementa = ementa;
                      await cursosStore.atualizarCurso();
                      await cursosStore.listarCursos();
                    });
                  }),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    EscolaDialogs.deletarCurso(context, () async {
                      await cursosStore.deletarCurso(curso.codigo!);
                      await cursosStore.listarCursos();
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
