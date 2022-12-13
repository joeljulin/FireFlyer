import 'package:FireFlyer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:FireFlyer/data/data.dart';
import '../widgets/article_carousel.dart';
import 'package:FireFlyer/assets.dart';
import '../widgets/sliver_appbar_delegate.dart';

class Home extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 50, 14, 8)
            ])),
        child: Scaffold(
            // By default, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              controller: _scrollController,
              slivers: const [ //HomeHeader(featuredContent: recentHeader),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0,0,0, 20),
                    child: HomeHeader(featuredContent: recentHeader),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('editorsPicks'),
                    title: 'Editor’s Picks',
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
                    key: PageStorageKey('trending'),
                    title: 'Trending',
                    articleList: trending,
                  ),
                ),
              ],
            )));
  }
}
