import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/ui/home/quran/surah_title_widget.dart';
import 'package:provider/provider.dart';

import 'verses_widget.dart';

class SurahDetailsScreen extends StatefulWidget {
  const SurahDetailsScreen({super.key});
  static const String routeName = 'SurahDetailsSC';

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    SurahTitleArgs args =
        ModalRoute.of(context)?.settings.arguments as SurahTitleArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(settingsProvider.getBackgroundImage()),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.text),
        ),
        body: verses.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Card(
                margin: const EdgeInsets.all(24),
                elevation: 16,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return VersesWidget(
                        content: verses[index], index: index + 1);
                  },
                  itemCount: verses.length,
                  separatorBuilder: (context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    color: Theme.of(context).primaryColor,
                    height: 2,
                  ),
                ),
              ),
      ),
    );
  }

  List<String> verses = [];
  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    verses = fileContent.split('\n');
    setState(() {});
  }
}
