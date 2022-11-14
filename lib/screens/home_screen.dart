import 'package:flutter/material.dart';
import 'package:FireFlyer/data/data.dart';
import '../widgets/article_carousel.dart';

class Home extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

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
          // By default, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: const [
              SliverToBoxAdapter(
                child: ArticleCarousel(
                  key: PageStorageKey('editorsPicks'),
                  title: 'Editors Picks',
                  articleList: editorsPicks,
                ),
              )
            ],
          )
      )
    );
  }
}
