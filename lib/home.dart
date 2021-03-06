import 'package:flutter/material.dart';
import 'package:news_app/provider/search_key_manager.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  var _currentIndex = 0;

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    //Container( color: Colors.blue,),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SearchKeyManager(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => ThemeProvider(),
          // ),
        ],
        child: Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Home'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              //const BottomNavigationBarItem( icon: Icon(Icons.account_circle), label: 'Profile'),
            ],
          ),
        ));
  }
}
