import 'package:flutter/material.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:movieapp/theme/style.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tmdbApi = TmdbApi();
  await tmdbApi.init();

  runApp(
      MultiProvider(
        providers: [
          Provider<TmdbApi>(create: (_) => tmdbApi,)
        ],
        child: MovieApp()
      )
  );
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExampleApp',
      theme: appTheme(),
      initialRoute: '/genres',
      routes: routes,
    );
  }
}
