import 'package:flutter/material.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String desc;
  final String title;
  const ServiceCard({
    super.key,
    required this.image,
    required this.desc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: ColorsManager.greyContainer,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(image, height: 60.h),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
            decoration: BoxDecoration(
              color: ColorsManager.primaryPurple,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(desc, style: TextStyles.font12WhiteMedium),
          ),
          Text(title, style: TextStyles.font14BlackMedium),
        ],
      ),
    );
  }
}
