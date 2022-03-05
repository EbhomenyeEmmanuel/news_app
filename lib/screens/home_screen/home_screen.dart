
import 'package:flutter/material.dart';
import 'package:news_app/api/news_repository.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/screens/home_screen/MoreBreakingNews.dart';

import 'breaking_news_list_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final repo = NewsRepository();

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          constraints: BoxConstraints.expand(
              width: screenSize.width, height: screenSize.height * 0.4),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/news_app_assets/card_smoothie.png')),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36.0),
                bottomRight: Radius.circular(36.0)),
          ),
          child: Stack(
            children: [
              buildTintForBackgroundImage(),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 16),
                  color: Colors.white,
                  icon: Icon(Icons.view_headline),
                  onPressed: () {},
                ),
              ),
              Positioned(
                  left: 16,
                  right: 10,
                  bottom: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildBlurNewsCategoryChip(),
                      SizedBox(height: 16),
                      Text(
                        "'V.I.P.Immunization' for the Powerful and Their Cronies Rattles South America ",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Learn More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ))
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
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MoreBreakingNews();
                  }));
                },
                child: Text(
                  "More", style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: repo.getTopStoriesData(),
              builder: (context, AsyncSnapshot<NewsData> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return BreakingNewsListView(
                      story: snapshot.data?.todayStories.sublist(0, 4) ?? []);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ]),
    );
  }

  Container buildTintForBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(36.0),
            bottomRight: Radius.circular(36.0)),
      ),
    );
  }

  Container buildBlurNewsCategoryChip() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          "News of the day",
          style: TextStyle(color: Colors.white),
        ));
  }
}
