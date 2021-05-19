import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../presentation/pages/home-screen.dart';

class FavoriteProvider extends ChangeNotifier{
  bool _isFavorite = false;
  bool get isFavorite => _isFavorite;
  toggleFavorite(){
    _isFavorite = !_isFavorite;
    notifyListeners();
  }



}