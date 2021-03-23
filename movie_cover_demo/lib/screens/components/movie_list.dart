import 'package:MovieCovers/model/PopularMovieModel.dart';
import 'package:MovieCovers/screens/components/movie_card.dart';
import 'package:MovieCovers/utils/size_config.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    Key key,
    @required this.popularMovies,
  }) : super(key: key);
  final PopularMovieModel popularMovies;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    final moviesList = popularMovies.results;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: GridView.builder(
        itemCount: moviesList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: defaultSize * 3.0,
          crossAxisSpacing: defaultSize * 1.5,
        ),
        itemBuilder: (context, index) => MovieCard(
          movie: moviesList[index],
        ),
      ),
    );
  }
}
