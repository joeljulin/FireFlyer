import 'package:flutter/material.dart';
import 'package:FireFlyer/data/data.dart';
import '../widgets/article_carousel.dart';

class Search extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  Search({super.key});
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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
                margin: const EdgeInsets.only(
                    top: 60, bottom: 0, left: 30, right: 30),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(32, 149, 149, 149),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: TextField(
                    cursorColor: Colors.white,
                    textAlignVertical: TextAlignVertical(y: 0),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What are you looking for?',
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(Icons.keyboard, color: Colors.white),
                        fillColor: Colors.transparent),
                  ),
                ))),
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
                key: PageStorageKey('trending'),
                title: 'Trending',
                articleList: trending,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
