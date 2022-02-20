import 'package:flutter/material.dart';
import 'package:news_app/home.dart';
import 'package:news_app/news_app_theme.dart';
import 'package:news_app/screens/search_screen/search_item_details_choice_chip_manager.dart';
import 'package:news_app/providers/tab_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: NewsAppTheme.light(),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => TabManager()),
        ChangeNotifierProvider(create: (context) => SearchItemDetailsChoiceChipManager())      ], child: HomePage()),
    );
  }
}
