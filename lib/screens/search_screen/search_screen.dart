import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/mock_news_service.dart';
import 'package:news_app/models/news_categories.dart';
import 'package:news_app/models/news_data.dart';
import 'package:news_app/models/stories.dart';
import 'package:news_app/screens/search_screen/search_item_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final mockService = MockBreakingNewsService();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    int _currentCategoryStateIndex = 0;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSearchHeader(primaryColor),
            Expanded(child: buildTabsFromTabView(context)),
          ]),
    );
  }

  Widget buildSearchHeader(Color primaryColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(top: 16.0),
            icon: Icon(Icons.view_headline),
            onPressed: () {},
          ),
          SizedBox(height: 16),
          Text("Discover", style: Theme.of(context).textTheme.headline1),
          SizedBox(height: 8),
          Text("News from all over the world ",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
          SizedBox(height: 16),
          buildSearchEditText(primaryColor),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Container buildSearchEditText(Color primaryColor) {
    return Container(
      height: 54,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 4),
          Flexible(
            child: TextField(
              cursorColor: primaryColor.withOpacity(0.5),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: primaryColor.withOpacity(0.5),
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabsFromTabView(BuildContext context) {
    return DefaultTabController(
        length: NewsCategories.values.length,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: TabBar(
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 8),
                      indicatorColor: Colors.black,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        for (var tabName in getTabNames())
                          buildTabForTabBar(tabName)
                      ]),
                ),
                Expanded(
                  child: TabBarView(children: [
                    for (var i in getTabNames()) buildTabViewList(i)
                  ]),
                ),
              ]),
        ));
  }

  ListView buildList(List<Story> story) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return buildCard(story[index], context);
      },
      itemCount: story.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 8);
      },
    );
  }

  getNewsByCategory(List<Story> list, String category) {
    //TODO("Filter list by category")
    return list;
  }

  Widget buildTabViewList(String category) {
    return FutureBuilder(
        future: mockService.getNewsData(),
        builder: (context, AsyncSnapshot<NewsData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var listOfNewsByCategory =
                getNewsByCategory(snapshot.data?.todayStories ?? [], category);
            return buildList(listOfNewsByCategory);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buildTabForTabBar(String tabTitle) {
    return Tab(
      child: Text(tabTitle, style: Theme.of(context).textTheme.headline2),
    );
  }

  Widget buildCard(Story story, BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SearchItemScreen(news: story);
          }));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //NewsIcon(imageUrl: story.imageUrl),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/news_app_assets/card_smoothie.png',
                    fit: BoxFit.fill,
                    width: 100,
                    height: 70,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.title,
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "4 hours ago",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.remove_red_eye, color: Colors.grey),
                              SizedBox(width: 4),
                              Text(
                                "376 views",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  List getTabNames() {
    var listOfTabNames = <String>[];
    for (NewsCategories newsCategory in NewsCategories.values) {
      var enumValue = newsCategory.toString().split('.').last;
      var capitalizedNewsCategory =
          enumValue[0].toUpperCase() + enumValue.substring(1);
      listOfTabNames.add(capitalizedNewsCategory);
    }
    return listOfTabNames;
  }
}
