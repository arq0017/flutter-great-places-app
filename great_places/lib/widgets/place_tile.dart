import 'package:flutter/material.dart';
import 'dart:io';

class PlaceTile extends StatelessWidget {
  final String title;
  final File image;
  PlaceTile({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: FileImage(image)),
      title: Text('$title'),
    );
  }
}
