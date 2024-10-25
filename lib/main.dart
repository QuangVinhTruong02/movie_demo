import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/type/language_type.dart';
import 'package:movie_demo/helper/provider_setup.dart';
import 'package:movie_demo/ui/my_app/my_app.dart';
import 'package:movie_demo/utils/app_const.dart';
import 'package:provider/provider.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: providers,
      child: EasyLocalization(
        supportedLocales: [
          LanguageType.english.getLocal,
          LanguageType.vietnamese.getLocal,
        ],
        path: AppConst.assetsPathLocalizations,
        child: Phoenix(
          child: const MyApp(),
        ),
      ),
    ),
  );
}
