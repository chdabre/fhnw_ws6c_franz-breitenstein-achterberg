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
  bool _isFavourite = false;
  String _posterUrl;


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

    _posterUrl = TmdbApi.buildImageUrl(widget.movie.posterPath, 'w185');
    _updateFavourite();
  }

  Widget get _posterImage => Image.network(_posterUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ThemeColors.mustard),
          ),
        );
      }
  );

  Widget get _favouriteIcon => Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(Icons.favorite, color: ThemeColors.mustard, size: 16,),
      )
  );

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Card(
          color: Colors.grey,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            onDoubleTap: _toggleFavourite,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                if (_posterUrl != null) _posterImage,
                if(_isFavourite) _favouriteIcon,
              ],
            ),
          ),
        )
    );
  }
}

