import 'package:flutter/material.dart';
import 'package:movieapp/theme/style.dart';

import 'routes.dart';

void main() {
  runApp(MovieApp());
}
class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExampleApp',
      theme: appTheme(),
      initialRoute: '/',
      routes: routes,
    );
  }
}
