import 'package:flutter/material.dart';

class EmptySearchScreen extends StatelessWidget {
  final String _category;

  EmptySearchScreen({Key? key, required String category})
      : _category = category,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/news_app_assets/card_smoothie.png'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Stories on $_category not found :(",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
