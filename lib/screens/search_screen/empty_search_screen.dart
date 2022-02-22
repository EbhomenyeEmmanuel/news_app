import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class EmptySearchScreen extends StatefulWidget {
  final String _category;

  EmptySearchScreen({Key? key, required String category})
      : _category = category,
        super(key: key);

  @override
  State<EmptySearchScreen> createState() => _EmptySearchScreenState();
}

class _EmptySearchScreenState extends State<EmptySearchScreen> {
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
                child: FutureBuilder<LottieComposition>(
                  future: _loadComposition(),
                  builder: (context, snapshot) {
                    var composition = snapshot.data;
                    if (composition != null) {
                      return Lottie(composition: composition);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Stories on ${widget._category} not found :(",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/json/no_data_found.json');
    return await LottieComposition.fromByteData(assetData);
  }
}
