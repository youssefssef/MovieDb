import 'package:flutter/material.dart';

class CenteredImageUrlProvider with ChangeNotifier {
  String _centeredImageUrl = '';

  String get centeredImageUrl => _centeredImageUrl;

  void setCenteredImageUrl(String imageUrl) {
    _centeredImageUrl = imageUrl;
    notifyListeners();
    print('Center Image Path: $_centeredImageUrl'); // Print the image path
  }
}
