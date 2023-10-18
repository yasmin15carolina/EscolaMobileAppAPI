import 'package:flutter/material.dart';

class EscolaDialogs {
  static showCustomDialog(
    context,
    String title,
    Widget content,
    Function onConfirm,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static cadastrarAluno(context, onConfirm) {
    TextEditingController nomeController = TextEditingController();
    showCustomDialog(
      context,
      'Cadastrar Aluno',
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(labelText: 'Nome do aluno'),
          ),
        ],
      ),
      () {
        if (nomeController.text.isNotEmpty) {
          onConfirm(nomeController.text);
        }
      },
    );
  }

  static atualizarAluno(context, String nome, onConfirm) {
    TextEditingController nomeController = TextEditingController(text: nome);
    showCustomDialog(
      context,
      'Atualizar Aluno',
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: nomeController,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
        ],
      ),
      () {
        if (nomeController.text.isNotEmpty) {
          onConfirm(nomeController.text);
        }
      },
    );
  }

  static deletarAluno(context, onConfirm) {
    showCustomDialog(
      context,
      'Deletar Aluno',
      Text("Deseja deletar esse aluno permanentemente?"),
      onConfirm,
    );
  }

  static cadastrarCurso(context, onConfirm) {
    TextEditingController descricaoController = TextEditingController();
    TextEditingController ementaController = TextEditingController();
    showCustomDialog(
      context,
      'Cadastrar Curso',
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: descricaoController,
            decoration: InputDecoration(labelText: 'Descricao'),
          ),
          TextFormField(
            controller: ementaController,
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Ementa'),
          ),
        ],
      ),
      () {
        if (descricaoController.text.isNotEmpty &&
            ementaController.text.isNotEmpty) {
          onConfirm(descricaoController.text, ementaController.text);
        }
      },
    );
  }

  static atualizarCurso(context, String descricao, String ementa, onConfirm) {
    TextEditingController descricaoController =
        TextEditingController(text: descricao);
    TextEditingController ementaController =
        TextEditingController(text: ementa);
    showCustomDialog(
      context,
      'Atualizar Curso',
      Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: descricaoController,
            decoration: InputDecoration(labelText: 'Descricao'),
          ),
          TextFormField(
            controller: ementaController,
            maxLines: 3,
            decoration: InputDecoration(labelText: 'Ementa'),
          ),
        ],
      ),
      () {
        if (descricaoController.text.isNotEmpty &&
            ementaController.text.isNotEmpty) {
          onConfirm(descricaoController.text, ementaController.text);
        }
      },
    );
  }

  static deletarCurso(context, onConfirm) {
    showCustomDialog(
      context,
      'Deletar Curso',
      Text("Deseja deletar esse curso permanentemente?"),
      onConfirm,
    );
  }

  static deletarMatricula(context, onConfirm) {
    showCustomDialog(
      context,
      'Remover Matricula',
      Text("Deseja remover essa matricula permanentemente?"),
      onConfirm,
    );
  }
}
