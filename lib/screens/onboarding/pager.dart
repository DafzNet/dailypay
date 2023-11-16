import 'package:dailypay/screens/onboarding/onboarding.dart';
import 'package:dailypay/utils/constants/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardPager extends StatefulWidget {
  const OnboardPager({super.key});

  @override
  State<OnboardPager> createState() => _OnboardPagerState();
}

class _OnboardPagerState extends State<OnboardPager> {
  PageController controller = PageController();
  int _pos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (value) {
                setState(() {
                  _pos = value;
                });
              },
              children: [
                Onboarder(
          
                ),
          
                Onboarder(
          
                ),
          
                Onboarder(
                  
                )
              ],
            ),
          ),

          SizedBox(
            height: 20,
            child: Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: _pos,
                decorator: DotsDecorator(
                  activeColor: dailiPayColor
                ),

                onTap: (position) {
                  controller.jumpToPage(position-1);
                  
                  _pos = position;

                  setState(() {
                    
                  });
                },
                
              ),
            ),
          )
        ],
      ),
    );
  }
}