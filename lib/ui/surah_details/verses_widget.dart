import 'package:flutter/material.dart';

class VersesWidget extends StatelessWidget {
  VersesWidget({required this.content, required this.index, super.key});
  String content;
  int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      ('$content {$index}'),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
