import 'package:flutter/material.dart';
import 'package:news_app/home.dart';
import 'package:news_app/news_app_theme.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'News App',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: NewsAppTheme.light(),
            darkTheme: NewsAppTheme.dark(),
            home: HomePage(),
          );
        });
  }
}
