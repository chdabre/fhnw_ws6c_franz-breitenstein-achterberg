import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/tmdb.dart';

import 'components/movie_grid_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _movies = List<Movie>();
  ScrollController _controller;
  int _page = 1;

  List<Widget> get _gridItems => _movies.map((m) => MovieGridTile(movie: m)).toList();

  void _loadMovies(int page) async {
    final List<Movie> newMovies = await TmdbApi.discoverMovies(page: page);
    _movies.addAll(newMovies);
    setState(() {});
  }

  /// from https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac
  void _scrollListener() {
    // Reached the bottom
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      _loadMovies(++_page);
    }
  }

  @override
  void initState() {
    _loadMovies(_page);
    _controller = ScrollController()..addListener(_scrollListener);

    super.initState();
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
                children: _gridItems
            ),
          ),
        ],
      )
    );
  }
}