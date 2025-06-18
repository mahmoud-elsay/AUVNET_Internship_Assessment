import 'package:flutter/material.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndAddressContainer extends StatelessWidget {
  const NameAndAddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: const [
            Color(0xFF8900FE),
            Color(0xFFA22FDB),
            Color(0xFFB34EC4),
            Color(0xFFC46FAB),
            Color(0xFFD28A98),
            Color(0xFFE1A682),
            Color(0xFFFFDE59),
          ],
          stops: const [0.0, 0.25, 0.38, 0.50, 0.63, 0.75, 1.0],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Delivering to', style: TextStyles.font12BlackBold),
                  verticalSpace(4),
                  Text(
                    'Al Satwa, 81A Street',
                    style: TextStyles.font16BlackBold,
                  ),
                  verticalSpace(7),
                  Text('Hi hepa! ', style: TextStyles.font30WhiteBold),
                ],
              ),
              CircleAvatar(
                radius: 30.r,
                backgroundImage: const AssetImage(
                  'assets/images/profile_photo.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
