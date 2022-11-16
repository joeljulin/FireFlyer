import 'package:flutter/material.dart';
import 'package:FireFlyer/data/data.dart';
import '../widgets/article_carousel.dart';
import 'package:FireFlyer/assets.dart';
import '../widgets/sliver_appbar_delegate.dart';

class Home extends StatelessWidget {
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
            // By default, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  floating: true,
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 250,
                    maxHeight: 250,
                    child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                      image: AssetImage(Assets.resume),
                      fit: BoxFit.fill,
                    ))),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('editorsPicks'),
                    title: 'Editors Picks',
                    articleList: editorsPicks,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ArticleCarousel(
                    key: PageStorageKey('mostRead'),
                    title: 'Most Read',
                    articleList: mostRead,
                  ),
                ),
              ],
            )));
  }
}
