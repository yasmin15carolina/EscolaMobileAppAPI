import 'package:escola_mobile/views/alunos_tab.dart';
import 'package:escola_mobile/views/cursos_tab.dart';
import 'package:escola_mobile/views/matriculas_view.dart';
import 'package:escola_mobile/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  List<Widget> tabs = [CursosTab(), AlunosTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context) => AlunosTab(),
                  ));
            }),
            buildCard("Cursos", Icons.menu_book_sharp, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CursosTab(),
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
      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(),
      //   child: NavigationBar(
      //     height: MediaQuery.of(context).size.height * 0.1,
      //     selectedIndex: index,
      //     onDestinationSelected: (index) async {
      //       setState(() {
      //         this.index = index;
      //       });
      //     },
      //     destinations: [
      //       NavigationDestination(
      //           icon: Icon(Icons.menu_book_sharp), label: "Cursos"),
      //       NavigationDestination(
      //           icon: Icon(
      //             Icons.person,
      //           ),
      //           label: "Alunos"),
      //     ],
      //   ),
      // ),
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
              color: Colors.orangeAccent,
              size: MediaQuery.of(context).size.width * 0.1,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: MediaQuery.of(context).size.width * 0.08),
            ),
          ],
        ),
      ),
    );
  }
}
