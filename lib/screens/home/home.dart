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
  ScrollController _controller;
  int _page = 1;

  void initState() {
    _loadMovies(_page);

    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
  }

  void _loadMovies(int page) {
    final tmdbApi = Provider.of<TmdbApi>(context, listen: false);
    tmdbApi.discoverMovies(page: page)
      .then((value) => setState((){ _movies.addAll(value); }));
  }

  /// from https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac
  void _scrollListener() {
    // Reached the bottom
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
          setState(() {
            debugPrint("reached bottom, page: " + _page.toString());
            _loadMovies(++_page);
          });
    }
  }

  GridTile _buildMovieGridTile(BuildContext context, Movie movie) {
    final posterUrl = TmdbApi.buildImageUrl(movie.posterPath, 'w185');

    return GridTile(
        child: Card(
          color: Colors.grey,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: posterUrl != null ? Image.network(posterUrl, fit: BoxFit.cover) : Container(),
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
      ),
      body: CustomScrollView(
        primary: false,
        controller: _controller,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text("wir glauben, dass dir diese filme gefallen könnten",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          SliverPadding(
            padding:  const EdgeInsets.all(16),
            sliver: SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 2/3,
                children: _movies.map((e) => _buildMovieGridTile(context, e)).toList()
            ),
          ),
        ],
      )
    );
  }
}
