import 'package:flutter/material.dart';
import '../widgets/article_carousel.dart';
import 'package:FireFlyer/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 50, 14, 8)
          ])),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              elevation: 0,
              centerTitle: false,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.account_circle, size: 50),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 10.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.exit_to_app, color: Colors.white ),
                    label: const Text('Sign out'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: Colors.red.withOpacity(0.75),
                      minimumSize: const Size(85, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    // launches the url of the article in app
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 24.0,
                            color: Color.fromARGB(255, 234, 231, 231),
                            fontWeight: FontWeight.w700),
                        text: FirebaseAuth.instance.currentUser?.displayName,
                      ),
                    ),
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 12.0,
                              color: Color.fromARGB(255, 234, 231, 231),
                              fontWeight: FontWeight.w300),
                        text: FirebaseAuth.instance.currentUser?.email
                      ),
                    )
                  ],
                )
              ),
              backgroundColor: const Color.fromARGB(0, 149, 149, 149),
            )),
        // By default, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: [
              const ArticleCarousel(
                key: PageStorageKey('favorites'),
                title: 'Favorites',
                articleList: favorites,
              ),
            ])),
          ],
        ),
        // By defaut, Scaffold background is white
        // Set its value to transparent
        // backgroundColor: Colors.transparent
      ),
    );
  }
}
