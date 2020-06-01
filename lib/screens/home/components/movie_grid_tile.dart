import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/db.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:movieapp/theme/style.dart';

class MovieGridTile extends StatefulWidget {
  const MovieGridTile({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  _MovieGridTileState createState() => _MovieGridTileState();
}

class _MovieGridTileState extends State<MovieGridTile> {
  bool isFavourite = false;
  String posterUrl;


  void _updateFavourite() {
    _isFavourite().then((value) => setState(() {
      isFavourite = value;
    }));
  }

  Future<bool> _isFavourite() async {
    final count = (await DB.queryId('movie', widget.movie.id)).length;
    return count > 0;
  }

  @override
  void initState() {
    super.initState();

    posterUrl = TmdbApi.buildImageUrl(widget.movie.posterPath, 'w185');
    _updateFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Card(
          color: Colors.grey,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onDoubleTap: () {
              if (!isFavourite) {
                DB.insert('movie', widget.movie);
              } else {
                DB.delete('movie', widget.movie);
              }
              _updateFavourite();
            },
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                if(posterUrl != null) Image.network(posterUrl, fit: BoxFit.cover),
                if(isFavourite) Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.favorite, color: ThemeColors.mustard, size: 16,),
                    )
                )
              ],
            ),
          ),
        )
    );
  }
}
