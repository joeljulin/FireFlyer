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
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 50, 14, 8)
          ])),
      child: Scaffold(
        // By defaut, Scaffold background is white
        // Set its value to transparent
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(tapped_content.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
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
              child: (
                  SizedBox(
                    height: 86,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w400),
                        text: tapped_content.description,
                      ),
                    ),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  TextButton.icon(
                    icon: const Icon(Icons.first_page, color: Colors.white ),
                    label: const Text('View other articles'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  ),
    
                  TextButton.icon(
                    icon: const Icon(Icons.read_more, color: Colors.white ),
                    label: const Text('Read'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
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
