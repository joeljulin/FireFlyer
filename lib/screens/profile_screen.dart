import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/article_carousel.dart';
import 'package:FireFlyer/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class Profile extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final user = FirebaseAuth.instance.currentUser!;

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
              leading: Text((user.displayName!),
                  style: const TextStyle(
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
          slivers: [
            SliverToBoxAdapter(
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(children: [
              const ArticleCarousel(
                key: PageStorageKey('favorites'),
                title: 'Favorites',
                articleList: favorites,
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 200, bottom: 0),
                  child: Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(165, 115, 115, 115),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: const Text(
                        'Sign Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  )),
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
