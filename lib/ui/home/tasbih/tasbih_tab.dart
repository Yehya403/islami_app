import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/settings_provider.dart';

class TasbihTab extends StatefulWidget {
  const TasbihTab({super.key});

  @override
  State<TasbihTab> createState() => _TasbihTabState();
}

class _TasbihTabState extends State<TasbihTab> {
  double turns = 0;

  int count = 0;

  final List<String> tasbihList = [
    'سبحان الله',
    'الحمد لله',
    'لَا إِلَهَ إِلَّا اللهُ',
    'الله اكبر'
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(provider.currentTheme == ThemeMode.light
                  ? 'assets/images/head_sebha_image.png'
                  : 'assets/images/head_sebha_image_dark.png'),
              Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        turns += 0.25;
                        count++;
                        if (count % 33 == 0) {
                          count = 0;
                          index = (index + 1) % 4;
                        }
                      });
                    },
                    child: AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 100),
                      child: Image.asset(
                          provider.currentTheme == ThemeMode.light
                              ? 'assets/images/sebha_image.png'
                              : 'assets/images/sebha_image_dark.png'),
                    ),
                  )),
            ],
          ),
          Column(
            children: [
              Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          width: 2, color: Theme.of(context).dividerColor)),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    '$count',
                    style: Theme.of(context).textTheme.titleLarge,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        width: 2, color: Theme.of(context).dividerColor)),
                child: Text(
                  tasbihList[index],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
