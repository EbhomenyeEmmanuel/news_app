import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/tab_manager.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  static List<Widget> pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
