import 'package:flutter/material.dart';

class ShowErrorWidget extends StatelessWidget {
  const ShowErrorWidget({
    Key key,
    @required this.error,
  }) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error,
        style: TextStyle(
          color: Colors.red.shade300,
          fontWeight: FontWeight.w200,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
