import 'package:flutter/material.dart';
import 'package:news_app/components/news_icon.dart';
import 'package:news_app/models/stories.dart';

class BreakingNewsListView extends StatelessWidget {
  final List<Story> _story;

  BreakingNewsListView({Key? key, required List<Story> story})
      : _story = story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CardWidget(story: _story[index]);
          },
          itemCount: _story.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 8);
          },
        ));
  }
}

class CardWidget extends StatelessWidget {
  final Story _story;

  const CardWidget({Key? key, required Story story})
      : _story = story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      child: Container(
        width: screenSize.width / 1.8,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NewsIcon(
              imageUrl: _story.imageUrl,
              imageWidth: screenSize.width / 1.8,
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${_story.title}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text("4 hours ago",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text("By ${_story.source}",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Text("");
        }));
      },
    );
  }
}
