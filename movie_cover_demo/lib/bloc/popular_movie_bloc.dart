import 'package:MovieCovers/model/PopularMovieModel.dart';
import 'package:MovieCovers/repository/movieRepositor.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  MovieRepository movieRepository;
  PopularMovieBloc(this.movieRepository) : super(OnInitial());

  @override
  Stream<PopularMovieState> mapEventToState(
    PopularMovieEvent event,
  ) async* {
    yield OnLoading();
    if (event is GetPopularMoviesData) {
      try {
        PopularMovieModel popularMovies = await movieRepository
            .getPopularMovies(event._page, event._language);
        yield OnSuccess(popularMovies);
      } catch (error) {
        yield OnError(error);
      }
    }
  }
}
