// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CursosStore on _CursosStoreBase, Store {
  late final _$mensagemErroAtom =
      Atom(name: '_CursosStoreBase.mensagemErro', context: context);

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

  late final _$cursosAtom =
      Atom(name: '_CursosStoreBase.cursos', context: context);

  @override
  ObservableList<CursoModel>? get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(ObservableList<CursoModel>? value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  late final _$cursoAtom =
      Atom(name: '_CursosStoreBase.curso', context: context);

  @override
  CursoModel? get curso {
    _$cursoAtom.reportRead();
    return super.curso;
  }

  @override
  set curso(CursoModel? value) {
    _$cursoAtom.reportWrite(value, super.curso, () {
      super.curso = value;
    });
  }

  late final _$listarCursosAsyncAction =
      AsyncAction('_CursosStoreBase.listarCursos', context: context);

  @override
  Future<dynamic> listarCursos() {
    return _$listarCursosAsyncAction.run(() => super.listarCursos());
  }

  late final _$cadastrarCursoAsyncAction =
      AsyncAction('_CursosStoreBase.cadastrarCurso', context: context);

  @override
  Future<dynamic> cadastrarCurso() {
    return _$cadastrarCursoAsyncAction.run(() => super.cadastrarCurso());
  }

  late final _$atualizarCursoAsyncAction =
      AsyncAction('_CursosStoreBase.atualizarCurso', context: context);

  @override
  Future<dynamic> atualizarCurso() {
    return _$atualizarCursoAsyncAction.run(() => super.atualizarCurso());
  }

  late final _$deletarCursoAsyncAction =
      AsyncAction('_CursosStoreBase.deletarCurso', context: context);

  @override
  Future<dynamic> deletarCurso(int codigo) {
    return _$deletarCursoAsyncAction.run(() => super.deletarCurso(codigo));
  }

  @override
  String toString() {
    return '''
mensagemErro: ${mensagemErro},
cursos: ${cursos},
curso: ${curso}
    ''';
  }
}
