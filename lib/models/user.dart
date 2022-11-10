import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:FireFlyer/models/models.dart';

class User {
  final String name;
  final num id;
  final Content favorites;

  const User({
    required this.id,
    required this.name,
    required this.favorites
  });
}