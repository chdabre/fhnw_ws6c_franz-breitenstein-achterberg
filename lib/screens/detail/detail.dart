import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  bool favourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("connässeur", style: Theme.of(context).textTheme.headline5,),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              if(favourite){
                favourite = false;
              }else{
                favourite= true;
              }
            });
          },
          child: Icon(favourite? Icons.favorite : Icons.favorite_border),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Cars (2006)", style: Theme.of(context).textTheme.headline3,),
                Text("Genres: Animation, Adventure, Comedy, Family", style: Theme.of(context).textTheme.bodyText2,),
                Text("Duration: 117 Minutes", style: Theme.of(context).textTheme.bodyText2,),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/qa6HCwP4Z15l3hpsASz3auugEW6.jpg",
                    height: 300,
                  ),
                ),
                SizedBox(height: 20),
                Text("Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town's offbeat characters.", style: Theme.of(context).textTheme.bodyText2,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network("https://image.tmdb.org/t/p/w533_and_h300_bestv2/sd4xN5xi8tKRPrJOWwNiZEile7f.jpg",
                    height: 250,
                  ),
                ),
                Text("Cast:", style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: Scrollbar(
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text("Crew:", style: Theme.of(context).textTheme.bodyText1,),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  child: Scrollbar(
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                            width: 100,
                            child: Stack(
                              children: <Widget>[
                                Image.network("https://image.tmdb.org/t/p/w600_and_h900_bestv2/ntN3DL1Us5G2PCvlfq112vLXRKa.jpg", fit: BoxFit.fill,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child:Text("Owen Wilson", style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                    Container(
                                      child:Text("Lightning McQueen", style: Theme.of(context).textTheme.bodyText2, textAlign: TextAlign.center,),
                                      color: Colors.white.withOpacity(0.6),
                                      width: 120,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            )
            ),
          ),
    );
  }
}