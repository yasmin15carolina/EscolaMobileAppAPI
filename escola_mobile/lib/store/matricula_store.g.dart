// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matricula_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatriculaStore on _MatriculaStoreBase, Store {
  late final _$mensagemErroAtom =
      Atom(name: '_MatriculaStoreBase.mensagemErro', context: context);

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

  late final _$matriculasAtom =
      Atom(name: '_MatriculaStoreBase.matriculas', context: context);

  @override
  ObservableList<MatriculaModel>? get matriculas {
    _$matriculasAtom.reportRead();
    return super.matriculas;
  }

  @override
  set matriculas(ObservableList<MatriculaModel>? value) {
    _$matriculasAtom.reportWrite(value, super.matriculas, () {
      super.matriculas = value;
    });
  }

  late final _$matriculaAtom =
      Atom(name: '_MatriculaStoreBase.matricula', context: context);

  @override
  MatriculaModel? get matricula {
    _$matriculaAtom.reportRead();
    return super.matricula;
  }

  @override
  set matricula(MatriculaModel? value) {
    _$matriculaAtom.reportWrite(value, super.matricula, () {
      super.matricula = value;
    });
  }

  late final _$listarMatriculasAsyncAction =
      AsyncAction('_MatriculaStoreBase.listarMatriculas', context: context);

  @override
  Future<dynamic> listarMatriculas() {
    return _$listarMatriculasAsyncAction.run(() => super.listarMatriculas());
  }

  late final _$listarMatriculasdoCursoAsyncAction = AsyncAction(
      '_MatriculaStoreBase.listarMatriculasdoCurso',
      context: context);

  @override
  Future<dynamic> listarMatriculasdoCurso(int codigo) {
    return _$listarMatriculasdoCursoAsyncAction
        .run(() => super.listarMatriculasdoCurso(codigo));
  }

  late final _$cadastrarMatriculaAsyncAction =
      AsyncAction('_MatriculaStoreBase.cadastrarMatricula', context: context);

  @override
  Future<bool> cadastrarMatricula(MatriculaModel novaMatricula) {
    return _$cadastrarMatriculaAsyncAction
        .run(() => super.cadastrarMatricula(novaMatricula));
  }

  late final _$deletarMatriculaAsyncAction =
      AsyncAction('_MatriculaStoreBase.deletarMatricula', context: context);

  @override
  Future<bool> deletarMatricula(int codigo) {
    return _$deletarMatriculaAsyncAction
        .run(() => super.deletarMatricula(codigo));
  }

  @override
  String toString() {
    return '''
mensagemErro: ${mensagemErro},
matriculas: ${matriculas},
matricula: ${matricula}
    ''';
  }
}
