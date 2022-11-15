import 'package:flutter/material.dart';
import 'package:FireFlyer/models/models.dart';

class ResumeCarousel extends StatelessWidget {
  final List<Content> articleList;

  const ResumeCarousel({
    required Key key,
    required this.articleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 220.0,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: articleList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = articleList[index];
                return GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    height: 175.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(content.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
