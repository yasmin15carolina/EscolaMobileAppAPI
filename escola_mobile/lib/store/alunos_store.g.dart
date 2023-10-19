// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alunos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunosStore on _AlunosStoreBase, Store {
  late final _$mensagemErroAtom =
      Atom(name: '_AlunosStoreBase.mensagemErro', context: context);

  @override
  String get mensagemErro {
    _$mensagemErroAtom.reportRead();
    return super.mensagemErro;
  }

  @override
  set mensagemErro(String value) {
    _$mensagemErroAtom.reportWrite(value, super.mensagemErro, () {
      super.mensagemErro = value;
    });
  }

  late final _$alunosAtom =
      Atom(name: '_AlunosStoreBase.alunos', context: context);

  @override
  ObservableList<AlunoModel>? get alunos {
    _$alunosAtom.reportRead();
    return super.alunos;
  }

  @override
  set alunos(ObservableList<AlunoModel>? value) {
    _$alunosAtom.reportWrite(value, super.alunos, () {
      super.alunos = value;
    });
  }

  late final _$alunoAtom =
      Atom(name: '_AlunosStoreBase.aluno', context: context);

  @override
  AlunoModel? get aluno {
    _$alunoAtom.reportRead();
    return super.aluno;
  }

  @override
  set aluno(AlunoModel? value) {
    _$alunoAtom.reportWrite(value, super.aluno, () {
      super.aluno = value;
    });
  }

  late final _$listarAlunosAsyncAction =
      AsyncAction('_AlunosStoreBase.listarAlunos', context: context);

  @override
  Future<dynamic> listarAlunos() {
    return _$listarAlunosAsyncAction.run(() => super.listarAlunos());
  }

  late final _$cadastrarAlunoAsyncAction =
      AsyncAction('_AlunosStoreBase.cadastrarAluno', context: context);

  @override
  Future<dynamic> cadastrarAluno() {
    return _$cadastrarAlunoAsyncAction.run(() => super.cadastrarAluno());
  }

  late final _$atualizarAlunoAsyncAction =
      AsyncAction('_AlunosStoreBase.atualizarAluno', context: context);

  @override
  Future<dynamic> atualizarAluno() {
    return _$atualizarAlunoAsyncAction.run(() => super.atualizarAluno());
  }

  late final _$deletarAlunoAsyncAction =
      AsyncAction('_AlunosStoreBase.deletarAluno', context: context);

  @override
  Future<bool> deletarAluno(int codigo) {
    return _$deletarAlunoAsyncAction.run(() => super.deletarAluno(codigo));
  }

  @override
  String toString() {
    return '''
mensagemErro: ${mensagemErro},
alunos: ${alunos},
aluno: ${aluno}
    ''';
  }
}
