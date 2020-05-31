import 'package:flutter/material.dart';
import 'package:movieapp/services/db.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:movieapp/theme/style.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await TmdbApi.init();
  await DB.init();

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'connässeur',
      theme: appTheme(),
      initialRoute: '/genres',
      routes: routes,
    );
  }
}
