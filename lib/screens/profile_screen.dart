import 'package:flutter/material.dart';
import '../widgets/article_carousel.dart';
import 'package:FireFlyer/data/data.dart';

class Profile extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Profile({super.key});
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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              leadingWidth: 400,
              leading: const Text(('  Profile'),
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 234, 231, 231))),
              backgroundColor: const Color.fromARGB(0, 149, 149, 149),
            )),
        // By default, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: const [
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('favorites'),
                title: 'Favorites',
                articleList: favorites,
              ),
            ),
          ],
        ),
        // By defaut, Scaffold background is white
        // Set its value to transparent
        // backgroundColor: Colors.transparent
      ),
    );
  }
}
