import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class SearchItemScreen extends StatefulWidget {
  final News _story;

  SearchItemScreen({Key? key, required News news})
      : _story = news,
        super(key: key);

  @override
  _SearchItemScreenState createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
  ArticleChip _articleSelected = ArticleChip.AuthorOfArticle;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(children: [
        Container(
          constraints: BoxConstraints.expand(
              width: screenSize.width, height: screenSize.height),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: NetworkImage(widget._story.imageUrl)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.centerLeft,
                          icon: Icon(Icons.arrow_back_ios),
                          padding: EdgeInsets.zero,
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 32.0),
                        buildBlurNewsCategoryChip(),
                        SizedBox(height: 16.0),
                        Text(
                          widget._story.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(height: 8.0),
                      ]),
                ),
                SizedBox(height: 16.0),
                CurvedCardDesignWidget(
                  story: widget._story,
                )
              ],
            ),
          ),
        ),
      ]),
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
          formatCategories(widget._story.categories.toString()),
          style: TextStyle(color: Colors.white),
        ));
  }

  String formatCategories(String categories) {
    var formattedValue = categories.replaceAll('[', '').replaceAll(']', '');
    formattedValue =
        formattedValue[0].toUpperCase() + formattedValue.substring(1);
    return formattedValue;
  }
}

class CurvedCardDesignWidget extends StatelessWidget {
  final News _story;

  const CurvedCardDesignWidget({Key? key, required News story})
      : _story = story,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChoiceChipsWidget(),
            SizedBox(height: 16),
            Text(_story.snippets, style: Theme.of(context).textTheme.headline3),
            SizedBox(height: 16),
            Text(_story.description,
                style: Theme.of(context).textTheme.bodyText1),
            Text(_story.description,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(height: 16),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(_story.source,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
          ],
        ),
      ),
    );
  }
}

class ChoiceChipsWidget extends StatefulWidget {
  ChoiceChipsWidget({Key? key}) : super(key: key);

  @override
  State<ChoiceChipsWidget> createState() => _ChoiceChipsWidgetState();
}

class _ChoiceChipsWidgetState extends State<ChoiceChipsWidget> {
  ArticleChip _articleChip = ArticleChip.AuthorOfArticle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ChoiceChip(
          selectedColor: Colors.black,
          selected: _articleChip == ArticleChip.AuthorOfArticle,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.person,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Micheal S.",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              )
            ],
          ),
          onSelected: (selected) {
            setState(() {
              _articleChip = ArticleChip.AuthorOfArticle;
            });
          },
        ),
        ChoiceChip(
          selectedColor: Colors.black,
          selected: _articleChip == ArticleChip.TimeOfArticle,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.access_time,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "2 hrs",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          onSelected: (selected) {
            setState(() {
              _articleChip = ArticleChip.TimeOfArticle;
            });
          },
        ),
        ChoiceChip(
          selectedColor: Colors.black,
          selected: _articleChip == ArticleChip.NoOfVisits,
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "376",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
          onSelected: (selected) {
            setState(() {
              _articleChip = ArticleChip.NoOfVisits;
            });
          },
        ),
      ],
    );
  }
}

enum ArticleChip { AuthorOfArticle, TimeOfArticle, NoOfVisits }
