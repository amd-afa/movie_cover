part of 'popular_movie_bloc.dart';

@immutable
class PopularMovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class OnInitial extends PopularMovieState {}

class OnLoading extends PopularMovieState {}

class OnSuccess extends PopularMovieState {
  final _popularMovies;
  OnSuccess(this._popularMovies);
  PopularMovieModel get getPopularMovies => _popularMovies;
  @override
  List<Object> get props => [_popularMovies];
}

class OnError extends PopularMovieState {
  final _error;
  OnError(this._error);
  String get getError => _error.toString();
  @override
  List<Object> get props => [_error];
}
