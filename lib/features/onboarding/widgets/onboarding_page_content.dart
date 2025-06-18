import 'package:flutter/material.dart';
import 'package:nawel/core/theming/styles.dart';
import 'package:nawel/core/helpers/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/onboarding/models/on_boarding_model.dart';

class OnboardingPageContent extends StatefulWidget {
  final OnBoardingModel page;
  final AnimationController animationController;

  const OnboardingPageContent({
    super.key,
    required this.page,
    required this.animationController,
  });

  @override
  State<OnboardingPageContent> createState() => _OnboardingPageContentState();
}

class _OnboardingPageContentState extends State<OnboardingPageContent> {
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeIn),
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: _slideAnimation.value * 50,
            child: Column(
              children: [
                Text(
                  widget.page.title,
                  style: TextStyles.font28SecondaryBlackMedium,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Text(
                    widget.page.description,
                    style: TextStyles.font14BlueWith90OpacityRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
