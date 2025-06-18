import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/home/ui/widgets/service_card.dart';


class ServiceCardListView extends StatelessWidget {
  const ServiceCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          ServiceCard(
            image: 'assets/images/food.png',
            desc: 'Up to 50%',
            title: 'Food',
          ),
          ServiceCard(
            image: 'assets/images/health.png',
            desc: '20 mins',
            title: 'Health &\nwellness',
          ),
          ServiceCard(
            image: 'assets/images/groceries.png',
            desc: '15 mins',
            title: 'Groceries',
          ),
        ],
      ),
    );

  }
}
