import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheetWidget extends StatefulWidget {
  const ThemeBottomSheetWidget({super.key});

  @override
  State<ThemeBottomSheetWidget> createState() => _ThemeBottomSheetWidgetState();
}

class _ThemeBottomSheetWidgetState extends State<ThemeBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  settingsProvider.changeCurrentTheme(ThemeMode.light);
                },
                child: settingsProvider.isLightEnabled()
                    ? getSelectedItem('Light')
                    : getUnselectedItem('Light')),
            InkWell(
                onTap: () {
                  settingsProvider.changeCurrentTheme(ThemeMode.dark);
                },
                child: settingsProvider.isLightEnabled()
                    ? getUnselectedItem('Dark')
                    : getSelectedItem('Dark')),
          ],
        ));
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style:Theme.of(context).textTheme.titleMedium?.copyWith(
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
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
