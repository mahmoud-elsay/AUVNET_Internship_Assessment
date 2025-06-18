import 'package:flutter/material.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/ui/widgets/offer_banner.dart';
import 'package:nawel/features/home/ui/widgets/promo_code_card.dart';
import 'package:nawel/features/home/ui/widgets/shortcuts_list_view.dart';
import 'package:nawel/features/home/ui/widgets/service_card_list_view.dart';
import 'package:nawel/features/home/ui/widgets/name_and_address_container.dart';
import 'package:nawel/features/home/ui/widgets/nearby_restaurants_list_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NameAndAddressContainer(),
            verticalSpace(6),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Services:', style: TextStyles.font20BlackBold),
                  verticalSpace(19),
                  ServiceCardListView(),
                  PromoCodeCard(),
                  verticalSpace(14),
                  Text('Shortcuts:', style: TextStyles.font20BlackBold),
                  verticalSpace(21),
                  const ShortcutsListView(),
                  verticalSpace(20),
                  const OfferBanner(),
                  Text('Popular restaurants nearby', style: TextStyles.font20BlackBold),
                  verticalSpace(16),
                  const NearbyRestaurantsListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
