import 'package:escola_mobile/models/curso_model.dart';
import 'package:flutter/material.dart';

class CursoView extends StatefulWidget {
  final CursoModel curso;
  const CursoView({super.key, required this.curso});

  @override
  State<CursoView> createState() => _CursoViewState();
}

class _CursoViewState extends State<CursoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
