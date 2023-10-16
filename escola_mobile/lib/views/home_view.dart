import 'package:escola_mobile/views/alunos_tab.dart';
import 'package:escola_mobile/views/cursos_tab.dart';
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
      body: Container(
        child: tabs[index],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(),
        child: NavigationBar(
          height: MediaQuery.of(context).size.height * 0.1,
          selectedIndex: index,
          onDestinationSelected: (index) async {
            setState(() {
              this.index = index;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.menu_book_sharp), label: "Cursos"),
            NavigationDestination(
                icon: Icon(
                  Icons.person,
                ),
                label: "Alunos"),
          ],
        ),
      ),
    );
  }
}
