import 'package:flutter/material.dart';
import 'package:movie_demo/core/type/state_rerender_type.dart';
import 'package:movie_demo/ui/widgets/app_textstyle.dart';
import 'package:movie_demo/ui/widgets/custom_button.dart';
import 'package:movie_demo/utils/app_colors.dart';
import 'package:movie_demo/utils/app_languages.dart';
import 'package:lottie/lottie.dart';

class StateRerenderPopup extends StatelessWidget {
  final StateRerenderType stateRerenderType;
  final String message;
  final Function? retryActionFunction;
  const StateRerenderPopup({
    super.key,
    required this.stateRerenderType,
    this.message = AppLanguages.loading,
    this.retryActionFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.grey1,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.white38,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(stateRerenderType.animatedImage),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                message,
                style: AppTextstyle().getMediumPoppinTextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(18),
              width: double.infinity,
              child: CustomButton(
                title: AppLanguages.cancel,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
