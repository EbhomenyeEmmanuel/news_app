import 'package:flutter/material.dart';
import 'package:news_app/screens/search_screen/search_item_screen.dart';

class SearchItemDetailsChoiceChipManager extends ChangeNotifier {
  ArticleChip _articleSelected = ArticleChip.AuthorOfArticle;

  ArticleChip getSelectedChoiceChip() => _articleSelected;

  void updateChoiceChip(ArticleChip articleChip) {
    _articleSelected = articleChip;
    notifyListeners();
  }
}
