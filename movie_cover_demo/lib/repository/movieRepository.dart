import 'package:MovieCovers/model/PopularMovieModel.dart';
import 'package:dio/dio.dart';

class MovieRepository {
  final String api = 'https://api.themoviedb.org';
  final String apiKey = '927807c66df7eada6050595530e12fa9';

  Future<PopularMovieModel> getPopularMovies(int page, String language) async {
    final popularMovies = await Dio().get(
        '$api/3/movie/popular?api_key=$apiKey&language=$language&page=$page');

    if (popularMovies.statusCode == 200) {
      return PopularMovieModel.fromJson(popularMovies.data);
    } else {
      throw Exception('Ops Irgendwas ist schief gelaufen!');
    }
  }
}
