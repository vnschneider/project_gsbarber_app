import 'package:flutter/material.dart';
import 'barbers_page.dart';
import 'barbershop_page.dart';
import 'gsbarber_page.dart';
import 'newspaper_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  int _currentIndex = 1;

  final pages = [
    GSBarberPage(),
    NewsPaperPage(),
    BarberShopPage(),
    BarbersPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ]),
        child: BottomNavigationBar(
          selectedItemColor: Colors.indigo[900],
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          iconSize: 32.0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageIcon(
                  AssetImage("assets/barbershopicon.png"),
                  size: 28,
                ),
              ),
              label: "GS Barber",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.newspaper,
              ),
              label: 'Notícias',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Serviços',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/barbericon2.png"),
              ),
              label: 'Barbeiros',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.face),
              label: 'Perfil',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
