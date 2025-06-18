import 'package:flutter/material.dart';
import 'package:nawel/core/routing/routes.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:nawel/core/helpers/extension.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:nawel/core/widgets/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/auth/login/ui/login_screen.dart';
import 'package:nawel/features/onboarding/models/on_boarding_model.dart';
import 'package:nawel/features/onboarding/widgets/onboarding_page_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final List<OnBoardingModel> pages = [
    OnBoardingModel(
      title: 'All-in-One Delivery',
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
  late final AnimationController _animationController;
  late final Animation<double> _logoOpacityAnimation;
  late final Animation<double> _logoScaleAnimation;
  late final Animation<Offset> _curveSlideAnimation;
  late final Animation<double> _bgOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Logo animations
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _logoScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Background curve slide
    _curveSlideAnimation = Tween<Offset>(
      begin: const Offset(-0.5, -0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    // Background green light fade
    _bgOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(
      context,
      Routes.loginScreen,
      arguments: PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) => const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Stack(
        children: [
          // Top-left curve
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Positioned(
                top: 0,
                left: 0,
                child: Transform.translate(
                  offset: _curveSlideAnimation.value * 100,
                  child: Image.asset(
                    'assets/images/onboarding_curve.png',
                    width: 200.w,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          // Bottom-right green light
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Positioned(
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: _bgOpacityAnimation.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 180.w,
                    height: currentPage < pages.length - 1 ? 180.h : 220.h,
                    child: Image.asset(
                      'assets/images/green_light_bg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _logoOpacityAnimation.value,
                      child: Transform.scale(
                        scale: _logoScaleAnimation.value,
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 336.w,
                          height: 336.h,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                width: 336.w,
                                height: 336.h,
                                color: ColorsManager.primaryPurple,
                                child: const Icon(
                                  Icons.error,
                                  color: ColorsManager.white,
                                  size: 50,
                                ),
                              ),
                        ),
                      ),
                    );
                  },
                ),
                verticalSpace(32),
                SizedBox(
                  height: 220.h,
                  child: PageView.builder(
                    itemCount: pages.length,
                    controller: _pageController,
                    itemBuilder:
                        (context, index) => OnboardingPageContent(
                          page: pages[index],
                          animationController: _animationController,
                        ),
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
                      _animationController.reset();
                      _animationController.forward();
                    } else {
                      _navigateToLogin();
                    }
                  },
                ),
                verticalSpace(16),
                GestureDetector(
                  onTap: _navigateToLogin,
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
