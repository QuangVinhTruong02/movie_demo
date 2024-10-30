import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/helper/routers.dart';
import 'package:movie_demo/ui/base/base_widget.dart';
import 'package:movie_demo/ui/my_app/my_app_viewmodel.dart';
import 'package:movie_demo/utils/app_shared.dart';
import 'package:movie_demo/utils/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode themeMode;
  @override
  void didChangeDependencies() {
    AppShared().getLocale().then(
      (Locale local) {
        context.setLocale(local);
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget<MyAppViewModel>(
      viewModel: MyAppViewModel(),
      onViewModelReady: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routers.generateRoute,
          initialRoute: Routers.splash,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
