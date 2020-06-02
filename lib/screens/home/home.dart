import 'package:flutter/material.dart';
import 'package:movieapp/models/genre.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/db.dart';
import 'package:movieapp/services/tmdb.dart';

import '../../components/movie_grid_tile.dart';
import 'components/search_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _movies = List<Movie>();
  String _searchQuery = "";
  ScrollController _controller;
  int _page = 1;

  List<Widget> get _gridItems => _movies.map((m) => MovieGridTile(
      key: Key(m.id.toString()),
      movie: m
  )).toList();

  void _loadMovies(int page) async {
    if (page == 1) _movies.clear();

    if (_searchQuery.trim().length > 0) {
      final List<Movie> searchResults = await TmdbApi.searchMovies(_searchQuery, page: page);
      _movies.addAll(searchResults);
    } else {
      final List<Genre> genres =  List<Genre>.from(
          (await DB.query('genre')).map((e) => Genre.fromMap(e)).toList()
      );

      final List<Movie> newMovies = await TmdbApi.discoverMovies(page: page, genres: genres);
      _movies.addAll(newMovies);
    }
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
      body: CustomScrollView(
        primary: false,
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.local_movies),
                  onPressed: () async {
                    await Navigator.pushNamed(context, '/genres');
                    setState(() {
                      _page = 1;
                    });
                    _loadMovies(_page);
                  }
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await Navigator.pushNamed(context, '/favourites');
                  setState(() {
                    _page = 1;
                  });
                  _loadMovies(_page);
                }
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: SearchHeader(
                onInput: (input) {
                  setState(() {
                    _searchQuery = input;
                    _page = 1;
                  });
                  _loadMovies(_page);
                },
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