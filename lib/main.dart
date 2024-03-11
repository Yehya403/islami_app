import 'package:flutter/material.dart';
import 'package:islami_app/providers/settings_provider.dart';
import 'package:islami_app/ui/hadeth_details/hadeth_details_screen.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/my_theme_data.dart';
import 'package:islami_app/ui/surah_details/surah_details_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (context) =>
        SettingsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemeData.lightMode,
      darkTheme: MyThemeData.darkMode,
      themeMode: settingsProvider.currentTheme,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SurahDetailsScreen.routeName: (_) => const SurahDetailsScreen(),
        HadethDetailsScreen.routeName: (_) => const HadethDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
