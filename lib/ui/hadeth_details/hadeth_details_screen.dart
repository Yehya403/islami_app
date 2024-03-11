import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';
import '../home/hadeth/hadeth_tab.dart';

class HadethDetailsScreen extends StatelessWidget {
  const HadethDetailsScreen({super.key});
  static const String routeName = 'HadethDetailsSC';
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    Hadeth hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.getBackgroundImage()),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Card(
            elevation: 12,
            margin: const EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )),
      ),
    );
  }
}
