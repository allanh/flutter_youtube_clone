import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final String msg;

  const MyErrorWidget({Key? key, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(msg));
  }
}
