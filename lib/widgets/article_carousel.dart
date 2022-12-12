import 'package:flutter/material.dart';
import 'package:FireFlyer/models/models.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:FireFlyer/screens/selected_article.dart';

class ArticleCarousel extends StatelessWidget {
  final String title;
  final List<Content> articleList;

  const ArticleCarousel({
    required Key key,
    required this.title,
    required this.articleList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 273,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: articleList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = articleList[index];
                return GestureDetector(
                    onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SelectedArticle(articleList[index])));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: 200.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 53,
                            width: 180.0,
                            child: RichText(
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              strutStyle: const StrutStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                                text: content.title,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
