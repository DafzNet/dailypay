import 'package:dailypay/screens/auth/login.dart';
import 'package:dailypay/screens/auth/signup/signup.dart';
import 'package:dailypay/screens/onboarding/onboarding.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
            child: Stack(
              children: [
                PageView(
                  controller: controller,

                  onPageChanged: (value) {
                    setState(() {
                      _pos = value;
                    });
                  },
                  children: const [
                    Onboarder(
                      bgImage: onboardingOne,

                      title: 'Stressless Daily\nPayment',
                      subtitle: 'T-fair || Food || more',
                    ),
          
                    Onboarder(
                      bgImage: onboardingTwo,

                      title: 'Free Daily\nTransfers',
                      subtitle: 'No charges for tranfers',
                    ),
          
                    Onboarder(
                      bgImage: onboardingThree,

                      title: 'Don\'t ever get\ntramped again' ,
                      subtitle: 'Dailypay everywhere you go',
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(bodyPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DefaultButton(
                        label: 'Sign Up',
                        color: Colors.white,
                
                        onTap: (){
                          Navigator.push(
                              context,
                              PageTransition(
                                child: SignUp(),
                                type: PageTransitionType.rightToLeft
                              )
                            );
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                
                      DefaultButton(
                          label: 'Log in',

                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: PinScreen(
                                  label: 'Login',
                                ),
                                type: PageTransitionType.rightToLeft
                              )
                            );
                          },
                        ),

                        SizedBox(
                          height: 10,
                        )
                
                    ],
                  ),
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

                onTap: (pos) {
                  controller.jumpToPage(pos);
                  _pos = pos;

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