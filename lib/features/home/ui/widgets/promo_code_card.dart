import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PromoCodeCard extends StatelessWidget {
  const PromoCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorsManager.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            SvgPicture.asset('assets/svgs/code_icon.svg'),
            horizontalSpace(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Got a code!',
                    style: TextStyles.font14GreyRegular,
                  ),
                  Text(
                    'Add your code and save on your\norder',
                    style: TextStyles.font14GreyRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}