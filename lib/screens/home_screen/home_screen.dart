import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/mock_news_service.dart';
import 'package:news_app/models/news_data.dart';

import 'breaking_news_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mockService = MockBreakingNewsService();

    Size screenSize = MediaQuery.of(context).size;
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            constraints: BoxConstraints.expand(
                width: screenSize.width, height: screenSize.height * 0.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:
                      AssetImage('assets/news_app_assets/card_smoothie.png')),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36.0),
                  bottomRight: Radius.circular(36.0)),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36.0),
                        bottomRight: Radius.circular(36.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                        Text(
                          "News of the day",
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(height: 16),
                        Text("News of the day"),
                      ]),
                )
              ],
            ),
          ),
        ]),
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Breaking News",
                  style: Theme.of(context).textTheme.headline2),
              Text(
                "More", style: Theme.of(context).textTheme.headline3,
                //TODO("Add onPressed to take you to gridView")
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        FutureBuilder(
            future: mockService.getNewsData(),
            builder: (context, AsyncSnapshot<NewsData> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data != null) {
                return BreakingNewsListView(
                    story: snapshot.data?.todayStories.sublist(0, 4) ?? []);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
