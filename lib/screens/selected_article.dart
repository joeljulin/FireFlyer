import 'package:flutter/material.dart';
import 'package:FireFlyer/models/content.dart';

import 'package:url_launcher/url_launcher.dart';
import '../main.dart';

class SelectedArticle extends StatelessWidget {
  final Content tapped_content;

  const SelectedArticle(this.tapped_content);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment(0,0.5),
              colors: [
            Color.fromARGB(255, 176, 69, 39),
            Color.fromARGB(255, 0, 0, 0)
          ])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tapped_content.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              child: (
                SizedBox(
                  height: 86,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: RichText(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 24.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w700),
                      text: tapped_content.title,
                    ),
                  ),
                )
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row (
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 75),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                        backgroundColor: Colors.grey.withOpacity(0.75),
                        minimumSize: const Size(85, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      // launches the url of the article in app
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MyStatefulWidget()));
                      },
                      child: const Text('< Back'),
                    )
                  ),
    
                  Container(
                    margin: EdgeInsets.only(left: 90, right: 20),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 16),
                        backgroundColor: Colors.blue.withOpacity(0.75),
                        minimumSize: const Size(85, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      // launches the url of the article in app
                      onPressed: () async {
                        if(await canLaunch(tapped_content.articleUrl)){
                          await launch(tapped_content.articleUrl);
                        }else {
                          throw 'Could not launch';
                        }
                      },
                      child: const Text('Read >'),
                    ),
                  ),
                ],
              )
            )
          ]
        )
      ),
    );
  }
}
