import 'package:MovieCovers/bloc/popular_movie_bloc.dart';
import 'package:MovieCovers/repository/movieRepositor.dart';
import 'package:MovieCovers/screens/components/movie_list.dart';
import 'package:MovieCovers/utils/const.dart';
import 'package:MovieCovers/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBody extends StatelessWidget {
  const MovieBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularMovieBloc(
        MovieRepository(),
      ),
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, state) {
        if (state is OnInitial) {
          final PopularMovieBloc popularMovieBloc = BlocProvider.of(context);
          popularMovieBloc.add(
            GetPopularMoviesData(PAGE_NUMBER, LANGUAGE_CODE),
          );
          return Center();
        } else if (state is OnLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is OnSuccess) {
          return MovieList(popularMovies: state.getPopularMovies);
        } else if (state is OnError) {
          return ShowErrorWidget(
            error: state.getError,
          );
        }
        return CircularProgressIndicator();
      }),
    );
  }
}
