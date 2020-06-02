import 'package:flutter/material.dart';
import 'package:movieapp/components/movie_grid_tile.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/db.dart';

class FavouritesScreen extends StatefulWidget {
  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Movie> _movies = List<Movie>();

  List<Widget> get _gridItems => _movies.map((m) => MovieGridTile(
      key: Key(m.id.toString()),
      movie: m,
      onUpdate: _loadMovies,
  )).toList();

  void _loadMovies() async {
    _movies = List<Movie>.from((await DB.query('movie')).map((e) => Movie.fromMap(e)).toList());
    setState(() {});
  }

  @override
  void initState() {
    _loadMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text("favoriten",  style: Theme.of(context).textTheme.headline4,),
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