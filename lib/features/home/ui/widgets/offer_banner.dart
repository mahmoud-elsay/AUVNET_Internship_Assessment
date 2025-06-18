import 'package:flutter/material.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({super.key});

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  final List<String> _imagePaths = [
    'assets/images/offer_banner.png',
    'assets/images/offer_banner.png',
    'assets/images/offer_banner.png',
    'assets/images/offer_banner.png',
    'assets/images/offer_banner.png',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: _imagePaths.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(child: Image.asset(_imagePaths[index]));
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              _imagePaths.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 5),
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentIndex == entry.key
                              ? ColorsManager.primaryPurple
                              : ColorsManager.lightGrey,
                    ),
                  ),
                );
              }).toList(),
        ),
        verticalSpace(34),
      ],
    );
  }
}
