import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/features/onboarding/models/on_boarding_model.dart';
import 'package:nawel/core/widgets/app_text_button.dart';
import 'package:nawel/core/helpers/extension.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      title: 'all-in-one delivery',
      description:
          'Order groceries, medicines, and meals delivered straight to your door',
    ),
    OnBoardingModel(
      title: 'User-to-User Delivery',
      description: 'Send or receive items from other users quickly and easily',
    ),
    OnBoardingModel(
      title: 'Sales & Discounts',
      description: 'Discover exclusive sales and deals every day',
    ),
  ];
  int currentPage = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/onboarding_curve.png',
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 180,
              height: currentPage < pages.length - 1 ? 180.h : 220.h,
              child: Image.asset(
                'assets/images/green_light_bg.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 336.w,
                  height: 336.h,
                ),
                verticalSpace(32),
                SizedBox(
                  height: 220.h,
                  child: PageView.builder(
                    itemCount: pages.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final page = pages[index];
                      return Column(
                        children: [
                          Text(
                            page.title,
                            style: TextStyles.font28SecondaryBlackMedium,
                            textAlign: TextAlign.center,
                          ),
                          verticalSpace(16),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: Text(
                              page.description,
                              style: TextStyles.font14BlueWith90OpacityRegular,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText:
                      currentPage == pages.length - 1 ? 'Get Started' : 'Next',
                  textStyle: TextStyles.font18WhiteMedium,
                  onPressed: () {
                    if (currentPage < pages.length - 1) {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, '/loginScreen');
                    }
                  },
                ),
                verticalSpace(16),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/loginScreen');
                  },
                  child: Text(
                    'skip',
                    style: TextStyles.font14BlueWith90OpacityRegular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
