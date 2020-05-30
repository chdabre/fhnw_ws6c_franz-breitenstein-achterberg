import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:movieapp/models/genre.dart';

import 'package:movieapp/models/movie.dart';
import 'package:movieapp/models/person.dart';

/// Wrapper for TMDB API
/// Call init() before making requests to load the API key from the secrets file.
class TmdbApi {
  static const String API_HOST = "api.themoviedb.org";
  static const String API_BASE_URL = "/3/";
  static const String IMAGE_BASE_URL = "https://image.tmdb.org/t/p/";

  String _apiKey;

  Future<void> init() async {
    _apiKey = await _loadApiKey();
  }

  Future<String> _loadApiKey() async {
    String secretsJson = await rootBundle.loadString("lib/services/secrets.json");
    return json.decode(secretsJson)['tmdb_key'];
  }

  Future<http.Response> _request(String path, { Map<String, String> queryParameters }) async {
    if (_apiKey == null) throw Exception('API not initialized');

    final query = {
      'api_key': _apiKey
    };

    if (queryParameters != null) query.addAll(queryParameters);

    final uri = Uri.https(API_HOST, API_BASE_URL + path, query);

    return await http.get(uri);
  }

  static String buildImageUrl(String imagePath, String size) {
    if (imagePath != null) {
      return IMAGE_BASE_URL + size + imagePath;
    } else {
      return null;
    }
  }

  Future<bool> testApi() async {
    final response = await _request('');

    return response.statusCode == 200;
  }

  Future<Movie> fetchMovie(int id) async {
    final response = await _request('movie/' + id.toString(), queryParameters: {
      'append_to_response': 'credits',
    });

    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch Movie. Status: ' + response.statusCode.toString());
    }
  }

  Future<List<Movie>> discoverMovies({int page = 1}) async {
    final response = await _request('discover/movie', queryParameters: {
      'sort_by': 'popularity.desc',
      'page': page.toString()
    });
    
    if (response.statusCode == 200) {
      return Movie.listFromJson(json.decode(response.body)['results']);
    } else {
      throw Exception('Failed to fetch Movie List. Status: ' + response.statusCode.toString());
    }
  }

  Future<Person> fetchPerson(int id) async {
    final response = await _request('person/' + id.toString());

    if (response.statusCode == 200) {
      return Person.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch Person. Status: ' + response.statusCode.toString());
    }
  }

  Future<List<Genre>> fetchGenres() async {
    final response = await _request('genre/movie/list');

    if (response.statusCode == 200) {
      return Genre.listFromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch Genres. Status: ' + response.statusCode.toString());
    }
  }
}
