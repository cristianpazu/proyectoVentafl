import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_venta_fl/screens/paginaprueb.dart';
import 'package:proyecto_venta_fl/screens/productos_screen.dart';

class Mainpage extends ConsumerStatefulWidget {
  const Mainpage({super.key});

  @override
  ConsumerState<Mainpage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<Mainpage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ProductosView(),
    MyWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: /* CurvedNavigationBar(
        items: <Widget>[
          Icon(Icons.home, size: 30,),
 
          Icon(Icons.home, size: 30),

         // Icon(Icons.home, size: 30),

          //Icon(Icons.home, size: 30),
        ],
        backgroundColor:  Color.fromRGBO(241, 243, 244, 1),
        buttonBackgroundColor:  Color.fromRGBO(241, 243, 244, 1),
        animationCurve: Curves.easeInOut,
        onTap: _onItemTapped,
      
      )*/
      
      
      BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ' ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Ver pagos',
          ),
        ],
      ), 
    );
  }
}