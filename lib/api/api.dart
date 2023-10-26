import 'dart:convert';

import 'package:moviesdb/Widget/constants.dart';
import 'package:moviesdb/models/movies.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingApi = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedApi = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upComingApi = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingApi));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something is not working');
    }
  }

  Future<List<Movie>> fetchTopeRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedApi));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something is not working');
    }
  }

  Future<List<Movie>> fetchUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingApi));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print(decodeData);
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something is not working');
    }
  }
}
