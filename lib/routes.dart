import 'package:flutter/widgets.dart';
import 'package:movieapp/screens/detail/detail.dart';
import 'package:movieapp/screens/home/home.dart';
import 'package:movieapp/screens/onboarding/genres.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/genres": (BuildContext context) => GenreScreen(),
  "/detail": (BuildContext context) => DetailScreen(),
};