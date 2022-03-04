import 'package:flutter/material.dart';

class SearchKeyManager extends ChangeNotifier {
  String _searchKey = "";

  void setSearchKey(String searchKey) {
    _searchKey = searchKey;
    notifyListeners();
  }

  String getSearchKey() => _searchKey;
}
