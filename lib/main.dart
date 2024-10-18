import 'package:flutter/material.dart';
import 'package:movie_demo/helper/provider_setup.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: providers,
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Routers.splash,
      theme: AppTheme().getApplicationTheme(),
    );
  }
}
