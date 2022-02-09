import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/components/news_icon.dart';
import 'package:news_app/models/stories.dart';

class BreakingNewsListView extends StatelessWidget {
  final List<Story> _story;

  BreakingNewsListView({Key? key, required List<Story> story})
      : _story = story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Text('');
        }));
      },
      child: Container(
          height: screenSize.height * 0.4,
          width: screenSize.height * 0.5,
          padding: EdgeInsets.only(left: 16, right: 5),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return buildCard(_story[index], context);
            },
            itemCount: _story.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 8);
            },
          )),
    );
  }
}

Widget buildCard(Story story, BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      //NewsIcon(imageUrl: story.imageUrl),
      Expanded(
        child: ClipRRect(
          child: Image.asset(
            'assets/news_app_assets/card_smoothie.png',
            fit: BoxFit.fill,
            width: 250,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      SizedBox(height: 8),
      Wrap(
        direction: Axis.vertical,
        runAlignment: WrapAlignment.start,
        children: [
          Text(
            '${story.title}',
            style: Theme.of(context).textTheme.headline6,
            maxLines: 3,
          ),
          Text("4 hours ago", style: Theme.of(context).textTheme.bodyText2),
          Text("By David E. Sanger",
              style: Theme.of(context).textTheme.bodyText2),
        ],
      )
    ],
  );
}
