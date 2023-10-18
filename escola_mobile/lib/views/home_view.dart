import 'package:escola_mobile/views/alunos/alunos_lista_view.dart';
import 'package:escola_mobile/views/cursos/cursos_lista_view.dart';
import 'package:escola_mobile/views/matriculas/matriculas_view.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import 'matriculas/cadastrar_matricula_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  List<Widget> tabs = [CursosListaView(), AlunosListaView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('HomeView'),
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: EscolaAppBar(),
      body: Container(
        // child: tabs[index],
        child: ListView(
          children: [
            buildCard("Alunos", Icons.person, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AlunosListaView(),
                  ));
            }),
            buildCard("Cursos", Icons.menu_book_sharp, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CursosListaView(),
                  ));
            }),
            buildCard("Matriculas", Icons.person, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MatriculasView(),
                  ));
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 20,
          height: 75,
          shape: CircularNotchedRectangle(),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Nova Matricula",
              style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[700],
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CadastrarMatriculaView(),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  buildCard(
    String text,
    IconData icon,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.orange[700],
              size: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: MediaQuery.of(context).size.width * 0.08),
            ),
          ],
        ),
      ),
    );
  }
}
