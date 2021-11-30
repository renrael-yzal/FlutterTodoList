import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String title_;
  AppBarWidget({required this.title_});

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title_));
  }
}
