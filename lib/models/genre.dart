/// Represents the primary information of a TMDB Person object.
/// https://developers.themoviedb.org/3/people/get-person-details
class Genre {
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
}