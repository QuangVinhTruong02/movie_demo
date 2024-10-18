import 'package:flutter/material.dart';
import 'package:movie_demo/ui/application/application_viewmodel.dart';
import 'package:movie_demo/ui/application/components/application_nav_item.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:provider/provider.dart';

class ApplicationBottomNavBar extends StatelessWidget {
  const ApplicationBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ApplicationViewModel>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
      decoration: BoxDecoration(border: Border(top: BorderSide(color: AppColors.blue))),
      child: StreamBuilder<int>(
        stream: viewModel.indexPageStream,
        builder: (context, snapshot) {
          int index = snapshot.data ?? 0;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: viewModel.indexPageList
                .map(
                  (item) => ApplicationNavItem(
                    title: item.title,
                    iconPath: item.iconPath,
                    onTap: () => viewModel.setIndexPage(item.index),
                    isSelected: index == item.index,
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
