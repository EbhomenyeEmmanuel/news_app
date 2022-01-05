import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/stories.dart';

class BreakingNewsListView extends StatelessWidget {
  final List<Story> _story;

  BreakingNewsListView({Key? key, required List<Story> story})
      : _story = story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Text('');
        }));
      },
      child: Padding(
          padding: EdgeInsets.zero,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCard(_story[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemCount: _story.length,
          )),
    );
  }
}

Widget buildCard(Story story) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Expanded(
        child: ClipRRect(
          child: Image.asset(
            'assets/news_app_assets/card_smoothie.png',
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      SizedBox(height: 10),
      Text("Candidate Biden called Saudi Arabia a Pariah"),
      SizedBox(height: 10),
      Text("4 hours ago"),
      SizedBox(height: 10),
      Text("By David E. Sanger")
    ],
  );
}
