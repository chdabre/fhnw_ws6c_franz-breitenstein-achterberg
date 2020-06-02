import 'model.dart';

/// Represents the primary information of a TMDB Genre object.
/// https://developers.themoviedb.org/3/genres/get-movie-list
class Genre extends Model{
  final int id;

  final String name;


  Genre({this.id, this.name,});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<Genre> listFromJson(List<dynamic> json) {
    return json.map((e) => Genre.fromJson(e)).toList();
  }

  static fromMap(Map<String, dynamic> map) {
    return Genre(
        id: map['id'],
        name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
    };

    if (id != null) map['id'] = id;

    return map;
  }
}