import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/services/tmdb.dart';
import 'dart:developer';

import 'package:movieapp/theme/style.dart';

class DetailScreen extends StatefulWidget {

  Movie movie;
  DetailScreen({this.movie});

  @override
  _DetailScreenState createState() => _DetailScreenState(movie);
}

class _DetailScreenState extends State<DetailScreen> {

  Movie movie;
  _DetailScreenState(this.movie);
  bool favourite = false;

  void loadMovie (id) async {
    movie = await TmdbApi.fetchMovie(id);
    setState(() {});
  }

  @override
  void initState() {
    loadMovie(movie.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ThemeColors.mustard,
          onPressed: () {
            setState(() {
              if(favourite == true){
                favourite = false;
              } else{
                favourite = true;
              }
            });
          },
          child: Icon(favourite? Icons.favorite : Icons.favorite_border),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(movie.title, style: Theme.of(context).textTheme.headline3,),
                SizedBox(height: 10),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(TmdbApi.buildImageUrl(movie.posterPath, 'h632'),
                      width: 300,
                    ),
                  ),
                  alignment: Alignment(0.0,0.0),
                  ),
                SizedBox(height: 20),
                Text("Year: " + movie.releaseDate.year.toString(), style: Theme.of(context).textTheme.bodyText2,),
                SizedBox(height: 20),
                Text(movie.overview, style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(TmdbApi.buildImageUrl(movie.backdropPath, 'h632'),
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Text("Cast", style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 10),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 150,
                      child: Scrollbar(
                        child: ListView(
                          // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: movie.cast.map((person) => Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: person != null ? Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: person.profilePath != null ? Image.network(TmdbApi.buildImageUrl(person.profilePath, 'w185'), fit: BoxFit.cover,
                                        width: 100,) : Image.asset("assets/icon/Portrait_Placeholder.png", fit: BoxFit.cover, width: 100,),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child:Text(person.name, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                          color: Colors.white.withOpacity(0.6),
                                          width: 100,
                                        ),
                                        Container(
                                          child:Text(person.character, style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                          color: Colors.white.withOpacity(0.6),
                                          width: 100,
                                        ),
                                      ],
                                    )
                                  ],
                                ): Container()
                            ),).toList()
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(0.0,0.0),
                ),
                SizedBox(height: 20),
                Text("Crew", style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 20),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 150,
                      child: Scrollbar(
                        child: ListView(
                          // This next line does the trick.
                            scrollDirection: Axis.horizontal,
                            children: movie.crew.map((person) => Container(
                                margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
                                child: person != null ? Stack(
                                  children: <Widget>[
                                    ClipRRect(
                                      child: person.profilePath != null ? Image.network(TmdbApi.buildImageUrl(person.profilePath, 'w185'), fit: BoxFit.cover,
                                        width: 100,) : Image.asset("assets/icon/Portrait_Placeholder.png", fit: BoxFit.cover, width: 100,),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child:Text(person.name, style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                          color: Colors.white.withOpacity(0.6),
                                          width: 100,
                                        ),
                                        Container(
                                          child:Text(person.job, style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                          color: Colors.white.withOpacity(0.6),
                                          width: 100,
                                        ),
                                      ],
                                    )
                                  ],
                                ): Container()
                            ),).toList()
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(0.0,0.0),
                ),
                SizedBox(height: 60),
              ],
            )
            ),
          ),
    );
  }
}