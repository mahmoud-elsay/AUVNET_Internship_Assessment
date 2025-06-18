import 'package:flutter/material.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantsListView extends StatelessWidget {
  const NearbyRestaurantsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRestaurant(
            'Allo Beirut',
            '32 mins',
            'assets/images/allo_beirut.png',
          ),
          _buildRestaurant('Laffah', '38 mins', 'assets/images/laffah.png'),
          _buildRestaurant(
            'Falafil AlRabiah Al kha...',
            '44 mins',
            'assets/images/falafil.png',
          ),
          _buildRestaurant('Barbar', '34 mins', 'assets/images/barbar.png'),
        ],
      ),
    );
  }

  Widget _buildRestaurant(String name, String time, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          verticalSpace(8.h),
          Text(name, style: TextStyles.font12BlackMedium),
          Text(time, style: TextStyles.font10BlackMedium58Opacity),
        ],
      ),
    );
  }
}
