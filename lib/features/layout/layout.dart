import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nawel/core/theming/colors_manager.dart';
import 'package:nawel/features/home/ui/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
      const HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Builder(
          builder: (context) {
            return Image(
              image: svg_provider.Svg('assets/svgs/home_bottom_nav.svg'),
              width: 24,
              height: 24,
              color: ColorsManager.primaryPurple,
              errorBuilder: (context, error, stackTrace) {
                print('SVG rendering error for home_bottom_nav.svg: $error');
                return Image.asset(
                  'assets/images/home_bottom_nav.png',
                  width: 24,
                  height: 24,
                  color: ColorsManager.primaryPurple,
                );
              },
            );
          },
        ),
        inactiveIcon: Builder(
          builder: (context) {
            return Image(
              image: svg_provider.Svg('assets/svgs/home_bottom_nav.svg'),
              width: 24,
              height: 24,
              color: Colors.grey,
              errorBuilder: (context, error, stackTrace) {
                print(
                  'SVG rendering error for home_bottom_nav.svg (inactive): $error',
                );
                return Image.asset(
                  'assets/images/home_bottom_nav.png',
                  width: 24,
                  height: 24,
                  color: Colors.grey,
                );
              },
            );
          },
        ),
        title: 'Home',
        activeColorPrimary: ColorsManager.primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/categoires_bottom_nav.svg',
          color: ColorsManager.primaryPurple,
          width: 24,
          height: 24,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svgs/categoires_bottom_nav.svg',
          color: Colors.grey,
          width: 24,
          height: 24,
        ),
        title: 'Categories',
        activeColorPrimary: ColorsManager.primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/deliver_bottom_nav.svg',
          color: ColorsManager.primaryPurple,
          width: 24,
          height: 24,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svgs/deliver_bottom_nav.svg',
          color: Colors.grey,
          width: 24,
          height: 24,
        ),
        title: 'Deliver',
        activeColorPrimary: ColorsManager.primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/cart_bottom_nav.svg',
          color: ColorsManager.primaryPurple,
          width: 24,
          height: 24,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svgs/cart_bottom_nav.svg',
          color: Colors.grey,
          width: 24,
          height: 24,
        ),
        title: 'Cart',
        activeColorPrimary: ColorsManager.primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          'assets/svgs/profile_bottom_nav.svg',
          color: ColorsManager.primaryPurple,
          width: 24,
          height: 24,
        ),
        inactiveIcon: SvgPicture.asset(
          'assets/svgs/profile_bottom_nav.svg',
          color: Colors.grey,
          width: 24,
          height: 24,
        ),
        title: 'Profile',
        activeColorPrimary: ColorsManager.primaryPurple,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: ColorsManager.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
