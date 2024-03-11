import 'package:flutter/material.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details_screen.dart';

import 'hadeth_tab.dart';

class HadethTitleWidget extends StatelessWidget {
  HadethTitleWidget(this.hadeth, {super.key});
  Hadeth hadeth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailsScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
