import 'package:escola_mobile/models/aluno_model.dart';
import 'package:escola_mobile/store/alunos_store.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/dialogs.dart';

class AlunosListaView extends StatefulWidget {
  const AlunosListaView({super.key});

  @override
  State<AlunosListaView> createState() => _AlunosListaViewState();
}

class _AlunosListaViewState extends State<AlunosListaView> {
  AlunosStore alunosStore = AlunosStore();
  @override
  void initState() {
    alunosStore.listarAlunos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EscolaAppBar(),
      body: Container(
        // color: Colors.purple,
        child: body(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[700],
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          EscolaDialogs.cadastrarAluno(context, (String nome) async {
            alunosStore.aluno = AlunoModel(nome: nome);
            await alunosStore.cadastrarAluno();
            await alunosStore.listarAlunos();
          });
        },
      ),
    );
  }

  body() {
    return Observer(
      builder: (context) {
        if (alunosStore.alunos == null) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          itemCount: alunosStore.alunos!.length,
          separatorBuilder: (context, index) =>
              Divider(), // Add a Divider between items
          itemBuilder: (context, index) {
            return buildAluno(alunosStore.alunos![index]);
          },
        );
      },
    );
  }

  Widget buildAluno(AlunoModel aluno) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text("ID: ${aluno.codigo}"),
          Expanded(
            flex: 4,
            child: Text("${aluno.nome}"),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  EscolaDialogs.atualizarAluno(context, aluno.nome,
                      (String nome) async {
                    alunosStore.aluno = aluno;
                    alunosStore.aluno!.nome = nome;
                    await alunosStore.atualizarAluno();
                    await alunosStore.listarAlunos();
                  });
                }),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  EscolaDialogs.deletarAluno(context, () async {
                    await alunosStore.deletarAluno(aluno.codigo!);
                    await alunosStore.listarAlunos();
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
