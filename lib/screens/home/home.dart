import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/tmdb.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _movies = List<Movie>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadMovies();
  }

  void _loadMovies() {
    final tmdbApi = Provider.of<TmdbApi>(context);
    tmdbApi.discoverMovies()
      .then((value) => { _movies = value });
  }

  GridTile _buildMovieGridTile(BuildContext context, Movie movie) {
    return GridTile(
        child: Card(
            child: Image.network(TmdbApi.buildImageUrl(movie.posterPath, 'w500'))
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text("wir glauben, dass dir diese filme gefallen könnten",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            SliverGrid.count(
                crossAxisCount: 3,
                children: _movies.map((e) => _buildMovieGridTile(context, e)).toList()
            )
          ],
        ),
      )
    );
  }
}
