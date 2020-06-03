import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/db.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:movieapp/theme/style.dart';

import 'components/person_list_tile.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Movie _movieData;
  bool _isFavourite = false;

  void _loadMovie (Movie movie) async {
    _movieData = await TmdbApi.fetchMovie(movie.id);
    setState(() {});
  }

  void _updateFavourite() async {
    final count = (await DB.queryId('movie', widget.movie.id)).length;
    _isFavourite = count > 0;
    setState(() {});
  }

  void _toggleFavourite() {
    if (!_isFavourite) {
      DB.insert('movie', widget.movie);
    } else {
      DB.delete('movie', widget.movie);
    }

    _updateFavourite();
  }

  @override
  void initState() {
    super.initState();

    _movieData = widget.movie;
    _loadMovie(widget.movie);
    _updateFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: _isFavourite ? ThemeColors.mustard : Colors.grey[200],
          onPressed: _toggleFavourite,
          child: Icon(_isFavourite? Icons.favorite : Icons.favorite_border, color: _isFavourite ? Colors.white : ThemeColors.textBlackMediumEmphasis,),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_movieData.title, style: Theme.of(context).textTheme.headline4,)
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(TmdbApi.buildImageUrl(_movieData.posterPath, 'h632'),
                      width: 300,
                    ),
                  ),
                  alignment: Alignment(0.0,0.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Year: " + _movieData.releaseDate.year.toString(), style: Theme.of(context).textTheme.bodyText2,),
                ),
                Text(_movieData.overview, style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(TmdbApi.buildImageUrl(_movieData.backdropPath, 'h632'),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                if (_movieData.cast != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cast", style: Theme.of(context).textTheme.headline5,)
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Scrollbar(
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _movieData.cast.map((person) => PersonListTile(person: person,),).toList()
                      ),
                    ),
                  ),
                ],
                if (_movieData.crew != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Crew", style: Theme.of(context).textTheme.headline5,)
                    ),
                  ),
                  Container(
                    height: 150,
                    child: Scrollbar(
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: _movieData.crew.map((person) => PersonListTile(person: person,),).toList()
                      ),
                    ),
                  ),
                ]
              ],
            )
            ),
          ),
    );
  }
}