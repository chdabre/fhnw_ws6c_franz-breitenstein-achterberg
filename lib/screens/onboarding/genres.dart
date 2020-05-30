import 'package:flutter/material.dart';

class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
        ),
        body: Padding(
          padding: null,
          child: ListView(
            children: <Widget>[
              Text("welche genres bevorzugst du?", style: Theme.of(context).textTheme.headline5,)
            ],
          ),
        )
    );
  }
}