import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  NavigationPageState createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int _indiceActual = 0;

  void _cambiarPagina(int indice) {
    setState(() {
      _indiceActual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: _cambiarPagina,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: '¿QUE ES?',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'INVITADOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'BOLETOS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'CONTACTO',
          ),
        ],
      ),
    );
  }
}
