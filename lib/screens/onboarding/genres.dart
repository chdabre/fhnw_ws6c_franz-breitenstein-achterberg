import 'package:flutter/material.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:provider/provider.dart';

class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> _genres = List<Genre>();
  List<Genre> selectedChoices = List<Genre>();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadGenres();
  }

  void _loadGenres() {
    final tmdbApi = Provider.of<TmdbApi>(context);
    tmdbApi.fetchGenres().then((value) => setState(() {
        _genres = value;
      }));
  }

  ChoiceChip _buildGenreChips(BuildContext context, Genre genre) {
    return ChoiceChip(
      selected: _isSelected,
      label: Text(genre.name),
    );
  }
  _buildChoiceList(){
    List<Widget> choices = List();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "connässeur",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Text(
                "welche genres bevorzugst du?",
                style: Theme.of(context).textTheme.headline5,
              ),
              Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: _genres.map((e) => _buildGenreChips(context, e)).toList()
              )
            ],
          ),
        ));
  }
}
