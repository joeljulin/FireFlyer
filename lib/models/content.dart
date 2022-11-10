import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String title;
  final String imageUrl;
  final String articleUrl;
  final String description;

  const Content({
    required this.title,
    required this.imageUrl,
    required this.articleUrl,
    required this.description,
  });
}