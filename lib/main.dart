import 'package:flutter/material.dart';
import 'package:news_app/home.dart';
import 'package:news_app/news_app_theme.dart';
import 'package:news_app/provider/search_key_manager.dart';
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
            ChangeNotifierProvider(create: (context) => SearchKeyManager
        (),) ], child: HomePage()),
    );
  }
}
