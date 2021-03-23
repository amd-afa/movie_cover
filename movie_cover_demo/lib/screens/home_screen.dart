import 'package:MovieCovers/screens/components/movie_body.dart';
import 'package:MovieCovers/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Beliebte Filme',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizeConfig.orientation == Orientation.portrait
          ? MovieBody()
          : SafeArea(child: MovieBody()),
    );
  }
}
