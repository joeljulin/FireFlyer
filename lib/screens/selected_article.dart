import 'package:flutter/material.dart';

class SelectedArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
            Color.fromARGB(255, 176, 69, 39),
            Color.fromARGB(255, 0, 0, 0)
          ])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
            ),
          )),
    );
  }
}
