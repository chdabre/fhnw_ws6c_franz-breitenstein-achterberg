import 'package:flutter/material.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/services/db.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:movieapp/theme/style.dart';

class GenreScreen extends StatefulWidget {
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> _genres = List<Genre>();
  List<Genre> _selectedGenres = List<Genre>();

  @override
  void initState() {
    super.initState();

    _loadTMDBGenres();
    _updateGenres();
  }

  void _loadTMDBGenres() async {
    _genres = await TmdbApi.fetchGenres();
    setState(() {});
  }

  void _updateGenres() async {
    _selectedGenres = List<Genre>.from(
        (await DB.query('genre')).map((e) => Genre.fromMap(e)).toList());
    setState(() {});
  }

  bool _isSelected(Genre genre) {
    return _selectedGenres.contains(genre);
  }

  void _toggleSelected(Genre genre) {
    if (!_isSelected(genre)) {
      DB.insert('genre', genre);
    } else {
      DB.delete('genre', genre);
    }
    _updateGenres();
  }

  Color _getChipColor(Genre genre) {
    return _isSelected(genre) ? ThemeColors.mustard : Colors.grey[200];
  }

  ActionChip _buildGenreChips(BuildContext context, Genre genre) {
    return ActionChip(
      onPressed: () => _toggleSelected(genre),
      backgroundColor: _getChipColor(genre),
      label: Text(genre.name),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "connässeur",
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "welche genres bevorzugst du?",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children:
                      _genres.map((e) => _buildGenreChips(context, e)).toList()
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  child: Text(
                    "finito",
                  ),
                  color: ThemeColors.mustard,
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, "/", (_) => false)
                ),
              ),
            ],
          )
       ),
    );
  }
}
