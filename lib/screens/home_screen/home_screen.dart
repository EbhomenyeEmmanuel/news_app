import 'dart:ui';

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
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints.expand(
                    width: screenSize.width, height: screenSize.height * 0.4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/news_app_assets/card_smoothie.png')),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36.0),
                      bottomRight: Radius.circular(36.0)),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.15),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36.0),
                            bottomRight: Radius.circular(36.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.view_headline),
                              onPressed: () {},
                            ),
                            SizedBox(height: 16),
                            Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 40,
                                      color: Colors.grey.withOpacity(0.5),
                                    )
                                  ],
                                ),
                                child: Text(
                                  "News of the day",
                                )),
                            SizedBox(height: 16),
                            Text(
                              "News of the day",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                    )
                  ],
                ),
              ),
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
              FutureBuilder(
                  future: mockService.getNewsData(),
                  builder: (context, AsyncSnapshot<NewsData> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return BreakingNewsListView(
                          story:
                              snapshot.data?.todayStories.sublist(0, 4) ?? []);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ]),
      ],
    );
  }
}
