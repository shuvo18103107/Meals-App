import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  // list e item gla jate const thake tai constructor initialize korar age const rakhlam r change kora jabe na
  const Category(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
