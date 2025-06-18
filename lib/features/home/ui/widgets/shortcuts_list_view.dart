import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShortcutsListView extends StatelessWidget {
  const ShortcutsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildShortcut('Past\norders', 'assets/svgs/past_orders.svg'),
          _buildShortcut('Super\nSaver', 'assets/svgs/super_saver.svg'),
          _buildShortcut('Must-tries', 'assets/svgs/must_tries.svg'),
          _buildShortcut('Give Back', 'assets/svgs/give_back.svg'),
          _buildShortcut('Best\nSellers', 'assets/svgs/best_sellers.svg'),
        ],
      ),
    );
  }

  Widget _buildShortcut(String title, String iconPath) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: BoxDecoration(
              color: ColorsManager.homeContainer,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: SvgPicture.asset(iconPath, height: 40.h,),
          ),
          verticalSpace(8),
          Text(title, style: TextStyles.font12BlackMedium),
        ],
      ),
    );
  }
}