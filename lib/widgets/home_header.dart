import 'package:flutter/material.dart';
import 'package:FireFlyer/widgets/widgets.dart';

import '../models/content.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeHeader extends StatelessWidget {
  final Content featuredContent;

  const HomeHeader({super.key,
    required this.featuredContent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 315.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featuredContent.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 315.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 20.0,
          bottom: 20,
          child: SizedBox(
            height: 86,
            width: 255.0,
            child: RichText(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 24.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.w700),
                text: featuredContent.title,
              ),
            ),
          ),
        ),
        Positioned(
          right: 20.0,
          bottom: 20.0,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                  backgroundColor: Colors.grey.withOpacity(0.75),
                  minimumSize: const Size(85, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                // launches the url of the article in app
                onPressed: () async {
                  if(await canLaunch(featuredContent.articleUrl)){
                    await launch(featuredContent.articleUrl);
                  }else {
                    throw 'Could not launch';
                  }
                },
                child: const Text('Resume'),
              )
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 5,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width-100,
          height: 7,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          ),
        ),
      ],
    );
  }
}