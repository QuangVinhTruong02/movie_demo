import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/utils/app_shared.dart';
import 'package:movie_demo/utils/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppShared _appShared;

  @override
  void initState() {
    super.initState();
    _appShared = context.read<AppShared>();
  }

  @override
  void didChangeDependencies() {
    _appShared.getLocale().then(
      (Locale local) {
        context.setLocale(local);
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.generateRoute,
      initialRoute: Routers.splash,
      theme: AppTheme().getApplicationTheme(),
    );
  }
}
