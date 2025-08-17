import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'utils/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vangti Chai',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      // This enables the app to follow system theme
      themeMode: ThemeMode.system,
  home: const MyHomePage(title: 'Vangti Chai'),
      debugShowCheckedModeBanner: false,
    );
  }
}
