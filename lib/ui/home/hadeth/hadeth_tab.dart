import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'hadeth_title_widget.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1, child: Image.asset('assets/images/hadeth_logo.png')),
          Container(
              decoration: BoxDecoration(
                  border: Border.symmetric(
                      horizontal: BorderSide(
                          width: 2, color: Theme.of(context).dividerColor))),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              width: double.infinity,
              child:  Text(
                'Hadeth',
                style: Theme.of(context).textTheme.titleLarge,
              )),
          Expanded(
            flex: 3,
            child: ahadethList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return HadethTitleWidget(ahadethList[index]);
                    },
                    itemCount: ahadethList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 128,
                        ),
                        color: Theme.of(context).dividerColor,
                        height: 2,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  List<Hadeth> ahadethList = [];

  void loadHadethFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = fileContent.trim().split('#');
    for (int i = 0; i < hadethList.length; i++) {
      String singleHadeth = hadethList[i];
      List<String> hadethLines = singleHadeth.trim().split('\n');
      String title = hadethLines.removeAt(0);
      String content = hadethLines.join('\n');
      Hadeth hadeth = Hadeth(title, content);
      ahadethList.add(hadeth);
    }
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;
  Hadeth(this.title, this.content);
}
