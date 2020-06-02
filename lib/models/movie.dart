import 'model.dart';
import 'person.dart';

/// Represents the primary information of a TMDB Movie object.
/// https://developers.themoviedb.org/3/movies/get-movie-details
class Movie extends Model {
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
      releaseDate: json['release_date'].length == 10 ? DateTime.parse(json['release_date']) : null,
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      cast: json['credits'] != null ? Person.listFromJson(json['credits']['cast']) : null,
      crew: json['credits'] != null ? Person.listFromJson(json['credits']['crew']) : null,
    );
  }

  static List<Movie> listFromJson(List<dynamic> json) {
    return json.map((e) => Movie.fromJson(e)).toList();
  }

  static fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      overview: map['overview'],
      releaseDate: map['release_date'] != null ? DateTime.parse(map['release_date']) : null,
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path']
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'title': title,
      'overview': overview,
      'release_data': releaseDate != null ? releaseDate.toIso8601String() : null,
      'poster_path': posterPath,
      'backdrop_path': backdropPath
    };

    if (id != null) map['id'] = id;

    return map;
  }
}