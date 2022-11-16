import 'package:flutter/material.dart';
import 'package:FireFlyer/data/data.dart';
import '../widgets/article_carousel.dart';

class Search extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
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
            preferredSize: const Size.fromHeight(50.0),
            child: AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.keyboard)),
              title: const Text('What are you looking for?',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 234, 231, 231))),
              backgroundColor: const Color.fromARGB(32, 149, 149, 149),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            )),
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
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
              ),
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
              ),
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
              ),
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
              ),
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
              ),
            ),
            SliverToBoxAdapter(
              child: ArticleCarousel(
                key: PageStorageKey('mostRead'),
                title: 'Most Read',
                articleList: mostRead,
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
