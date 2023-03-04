import 'dart:convert';
import 'package:appmovie/models/cast_model.dart';
import 'package:appmovie/models/movie_model.dart';
import '../models/movie_detail_model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService{
  Future<List<MovieModel>> getMovies() async {
    List<MovieModel> movies = [];
    String _url ="$pathProduction/movie/popular?api_key=$apiKey&language=es-ES&page=1";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if(_response.statusCode == 200){
      Map<String, dynamic> moviesMap = json.decode(_response.body);
      movies = moviesMap["results"].map<MovieModel>((e)=>MovieModel.fromJson(e)).toList();
      return movies;
    }
    return movies;
  }

  Future<MovieDetailModel?> getMovie(int movieId) async {
    String _url ="$pathProduction/movie/$movieId?api_key=$apiKey&language=es-ES";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    if(_response.statusCode == 200){
      Map<String, dynamic> movieMap = json.decode(_response.body);
      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(movieMap);
      return movieDetailModel;
    }
    return null;
  }

  Future<List<CastModel>> getCastsByMovie(int movieId) async{
    List<CastModel> casts = [];
    String _url = "$pathProduction/movie/$movieId/credits?api_key=$apiKey&language=es-ES";
    Uri _uri = Uri.parse(_url);
    http.Response _response = await http.get(_uri);
    print(_url);
    if(_response.statusCode == 200){
      Map<String, dynamic> castsMap = json.decode(_response.body);
      casts = castsMap["cast"].map<CastModel>((e)=>CastModel.fromJson(e)).toList();
      print(casts);
      return casts;
    }
    return casts;
  }
}