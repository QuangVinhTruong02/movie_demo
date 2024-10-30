import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo/core/type/language_type.dart';
import 'package:movie_demo/ui/setting/components/setting_item.dart';
import 'package:movie_demo/ui/setting/setting_viewmodel.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/custom_appbar.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SettingViewModel>();
    return Scaffold(
      appBar: CustomAppbar(title: AppLanguages.setting.tr()),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 24, right: 24),
        child: Column(
          children: [
            StreamBuilder<bool>(
                stream: viewModel.darkModeStream,
                builder: (context, snapshot) {
                  bool hasDarkMode = snapshot.data ?? false;
                  return SettingItem(
                    title: AppLanguages.darkMode.tr(),
                    suffixWidget: Switch(
                      trackColor: WidgetStateProperty.all(AppColors.grey1),
                      activeTrackColor: AppColors.blue,
                      inactiveThumbColor: Colors.white,
                      activeColor: AppColors.blue,
                      value: hasDarkMode,
                      onChanged: viewModel.onSwitchDarkMode,
                    ),
                  );
                }),
            const SizedBox(height: 10),
            SettingItem(
              title: AppLanguages.language.tr(),
              suffixWidget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.blue),
                ),
                child: StreamBuilder<LanguageType>(
                    stream: viewModel.languageTypeStream,
                    builder: (context, snapshot) {
                      LanguageType languageType = snapshot.data ?? LanguageType.english;
                      return DropdownButton<LanguageType>(
                        value: languageType,
                        dropdownColor: AppColors.grey1,
                        borderRadius: BorderRadius.circular(12),
                        underline: const SizedBox.shrink(),
                        style: AppTextstyle().getMediumMontserratTextStyle(context: context),
                        items: LanguageType.values
                            .map(
                              (item) => DropdownMenuItem<LanguageType>(
                                value: item,
                                child: Text(item.title),
                              ),
                            )
                            .toList(),
                        onChanged: viewModel.onPressedChangeLocale,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
