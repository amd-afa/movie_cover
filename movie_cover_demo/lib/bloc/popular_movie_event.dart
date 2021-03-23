part of 'popular_movie_bloc.dart';

@immutable
class PopularMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPopularMoviesData extends PopularMovieEvent {
  final _page;
  final _language;
  GetPopularMoviesData(this._page, this._language);
  @override
  List<Object> get props => [_page, _language];
}
