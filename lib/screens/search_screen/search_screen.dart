import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_categories.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
              style: Theme.of(context).textTheme.bodyText1),
          SizedBox(height: 16),
          buildSearchEditText(primaryColor),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Container buildSearchEditText(Color primaryColor) {
    return Container(
      height: 54,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 4),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: primaryColor.withOpacity(0.5),
                  ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(Icons.search), fillColor:  Color(0xffF6F6F6)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabsFromTabView(BuildContext context) {
    return DefaultTabController(
        //length: NewsCategories.values.length,
        length: NewsCategories.values.length,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0,),
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
                        Tab(
                          child: Text("General",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Tab(
                          child: Text("Entertainment",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Tab(
                          child: Text("Politics",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Tab(
                          child: Text("Science",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        Tab(
                          child: Text("Tech",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                      ]),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: TabBarView(children: [
                    Container(
                      color: Colors.blue,
                      child: Text("First"),
                    ),
                    Container(color: Colors.red,
                        child: Text("Second")),
                    Container(child: Text("Third")),
                    Container(child: Text("Fourth")),
                    Container(child: Text("Fifth")),
                  ]),
                ),
              ]),
        ));
  }
}
