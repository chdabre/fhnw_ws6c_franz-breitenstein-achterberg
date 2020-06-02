import 'model.dart';

/// Represents the primary information of a TMDB Person object.
/// https://developers.themoviedb.org/3/people/get-person-details
class Person extends Model {
  final int id;

  final String name;
  final String character;
  final String job;

  final String profilePath;


  Person({this.id, this.name, this.character, this.job, this.profilePath});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      job: json['job'],
      profilePath: json['profile_path']
    );
  }

  static List<Person> listFromJson(List<dynamic> json) {
    return json.map((e) => Person.fromJson(e)).toList();
  }

  static fromMap(Map<String, dynamic> map) {
    return Person(
        id: map['id'],
        name: map['name'],
        character: map['character'],
        job: map['job'],
        profilePath: map['profile_path']
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'character': character,
      'job': job,
      'profile_path': profilePath,
    };

    if (id != null) map['id'] = id;

    return map;
  }
}