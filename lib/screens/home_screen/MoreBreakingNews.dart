import 'package:flutter/material.dart';
import 'package:news_app/components/news_icon.dart';
import 'package:news_app/components/shimmer_breaking_news_list_widget.dart';
import 'package:news_app/models/stories.dart';

import '../../api/news_repository.dart';
import '../../models/news_data.dart';
import '../search_screen/empty_search_screen.dart';

class MoreBreakingNews extends StatefulWidget {
  @override
  State<MoreBreakingNews> createState() => _MoreBreakingNewsState();
}

class _MoreBreakingNewsState extends State<MoreBreakingNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 8),
      child: RefreshIndicator(
        color: Colors.white,
        backgroundColor: Colors.purple,
        onRefresh: () async {
          //await Future.delayed(Duration(seconds: 2));
          setState(() {});
        },
        child: Column(
          children: [
            Text("Breaking News", style: Theme.of(context).textTheme.headline2),
            SizedBox(height: 8),
            Expanded(
              child: FutureBuilder(
                  future: NewsRepository().getTopStoriesData(),
                  builder: (context, AsyncSnapshot<NewsData> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final items = snapshot.data?.todayStories ?? [];
                      return items.isNotEmpty
                          ? ListView.separated(
                              itemBuilder: (context, index) {
                                return BreakingNewsTileWidget(items[index]);
                              },
                              itemCount: items.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 16);
                              },
                            )
                          : EmptySearchScreen();
                    } else {
                      return Center(
                        child: ShimmerMoreBreakingNewsListWidget(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
    ));
  }
}

class BreakingNewsTileWidget extends StatelessWidget {
  final Story _item;

  const BreakingNewsTileWidget(
    Story item, {
    Key? key,
  })  : _item = item,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NewsIcon(
          imageUrl: _item.imageUrl,
          imageWidth: screenSize.width,
        ),
        SizedBox(height: 16),
        Text('${_item.description}',
            style: Theme.of(context).textTheme.headline4)
      ],
    );
  }
}
