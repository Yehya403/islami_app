import 'package:flutter/material.dart';

class LanguageBottomSheetWidget extends StatefulWidget {
  const LanguageBottomSheetWidget({super.key});

  @override
  State<LanguageBottomSheetWidget> createState() =>
      _LanguageBottomSheetWidgetState();
}

class _LanguageBottomSheetWidgetState extends State<LanguageBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getSelectedItem('English'),
            getUnselectedItem('العربيه'),
          ],
        ));
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Icon(Icons.check, color: Theme.of(context).colorScheme.secondary, size: 32),
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Text(
      text,
      style:Theme.of(context).textTheme.titleMedium
    );
  }
}
