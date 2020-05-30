import 'person.dart';

/// Represents the primary information of a TMDB Movie object.
/// https://developers.themoviedb.org/3/movies/get-movie-details
class Movie {
  final int id;

  final String title;
  final String overview;

  final DateTime releaseDate;

  final String posterPath;
  final String backdropPath;

  final List<Person> cast;
  final List<Person> crew;

  Movie({this.id, this.title, this.overview, this.releaseDate, this.posterPath,
    this.backdropPath, this.cast, this.crew});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: DateTime.parse(json['release_date']),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      cast: json['credits'] != null ? Person.listFromJson(json['credits']['cast']) : null,
      crew: json['credits'] != null ? Person.listFromJson(json['credits']['crew']) : null,
    );
  }

  static List<Movie> listFromJson(List<dynamic> json) {
    return json.map((e) => Movie.fromJson(e)).toList();
  }
}