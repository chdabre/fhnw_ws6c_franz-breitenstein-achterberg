import 'package:flutter/widgets.dart';
import 'package:movieapp/screens/favourites/favourites.dart';
import 'package:movieapp/screens/home/home.dart';
import 'package:movieapp/screens/onboarding/genres.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/favourites": (BuildContext context) => FavouritesScreen(),
  "/genres": (BuildContext context) => GenreScreen(),
};