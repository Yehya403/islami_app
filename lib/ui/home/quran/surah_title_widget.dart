import 'package:flutter/material.dart';
import 'package:islami_app/ui/surah_details/surah_details_screen.dart';

class SurahTitleWidget extends StatelessWidget {
   SurahTitleWidget(this.text, this.index, {super.key});
  String text;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.of(context).pushNamed(SurahDetailsScreen.routeName,
            arguments: SurahTitleArgs(text, index))
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 64),
          alignment: Alignment.center,
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          )),
    );
  }
}

class SurahTitleArgs {
  String text;
  int index;
  SurahTitleArgs(this.text, this.index);
}
