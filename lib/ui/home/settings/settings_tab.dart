import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import 'LanguageBottomSheetWidget.dart';
import 'ThemeBottomSheetWidget.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Theme',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                        width: 2, color: Theme.of(context).dividerColor)),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Text(
                  settingsProvider.isLightEnabled() ? 'Light' : 'Dark',
                  style: Theme.of(context).textTheme.titleSmall,
                )),
          ),
          const SizedBox(
            height: 18,
          ),
           Text(
            'Language',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              showLangaugeBottomSheet();
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.background,
                    border: Border.all(
                        width: 2, color: Theme.of(context).dividerColor)),
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child:  Text(
                  'English',
                  style: Theme.of(context).textTheme.titleSmall,
                )),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ThemeBottomSheetWidget();
        });
  }

  void showLangaugeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return LanguageBottomSheetWidget();
        });
  }
}
