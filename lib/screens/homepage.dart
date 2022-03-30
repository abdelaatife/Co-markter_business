import 'package:flutter/material.dart';
import 'package:soultion/matrial/const.dart';
import 'package:line_icons/line_icons.dart';
import 'package:soultion/screens/homepage/Store.dart';
import 'package:soultion/screens/homepage/analatices.dart';
import 'package:soultion/screens/homepage/designe.dart';
import 'package:soultion/screens/homepage/home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  PageController _pageController = PageController(initialPage: 0);
  
  @override
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (newindex) {
            setState(() {
              index = newindex;
            });
          },
          children: [
            home(),
            analtices(),
            designe(),
            store(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LineIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.pieChart),
              label: 'Analatices',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.pen),
              label: 'Designe',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.store),
              label: 'Store',
            ),
          ],
          currentIndex: index,
          selectedItemColor: dark,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 50), curve: Curves.ease);
          },
        ));
  }
}
