import 'package:flutter/material.dart';
import 'package:news_app/models/stories.dart';
import 'package:news_app/screens/search_screen/search_item_details_choice_chip_manager.dart';
import 'package:provider/provider.dart';

class SearchItemScreen extends StatefulWidget {
  final Story _story;

  SearchItemScreen({Key? key, required Story news})
      : _story = news,
        super(key: key);

  @override
  _SearchItemScreenState createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
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
                fit: BoxFit.cover,
                image: AssetImage('assets/news_app_assets/card_smoothie.png')),
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
                        SizedBox(height: 16.0),
                        Text(
                          widget._story.snippets,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        ),
                      ]),
                ),
                SizedBox(height: 16.0),
                buildCurvedCardDesign(context)
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
          widget._story.categories.toString(),
        ));
  }

  Widget buildCurvedCardDesign(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildChoiceChipsDesign(),
            SizedBox(height: 16),
            Text("Candidate Biden Called Saudi",
                style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 8),
            Text(
                "Capture the beauty that catches your eye with a mirrorless camera that you don't want to lose",
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
    );
  }

  Widget buildChoiceChipsDesign() {
    return Consumer<SearchItemDetailsChoiceChipManager>(
        builder: (context, manager, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip(
            selectedColor: Colors.black,
            selected:
                manager.getSelectedChoiceChip() == ArticleChip.AuthorOfArticle,
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
                  "Micheal Savior",
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            onSelected: (selected) {
              manager.updateChoiceChip(ArticleChip.AuthorOfArticle);
            },
          ),
          ChoiceChip(
            selectedColor: Colors.black,
            selected:
                manager.getSelectedChoiceChip() == ArticleChip.TimeOfArticle,
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
                Text("2 hrs")
              ],
            ),
            onSelected: (selected) {
              manager.updateChoiceChip(ArticleChip.TimeOfArticle);
            },
          ),
          ChoiceChip(
            selectedColor: Colors.black,
            selected: manager.getSelectedChoiceChip() == ArticleChip.NoOfVisits,
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
                Text("376")
              ],
            ),
            onSelected: (selected) {
              manager.updateChoiceChip(ArticleChip.NoOfVisits);
            },
          ),
        ],
      );
    });
  }
}

enum ArticleChip { AuthorOfArticle, TimeOfArticle, NoOfVisits }
