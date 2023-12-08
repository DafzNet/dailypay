import 'package:dailypay/screens/auth/signup/verify_phone.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/constants/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final phoneNo = TextEditingController();
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                  Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(fontSize: 20),
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Enter Your Phone Number'
                  ),

                  const SizedBox(height: 70,),

                  TextInputField(
                    'Phone Number',

                    controller: phoneNo,
                  ),

                  SizedBox(height: 20,),

                  Row(
                    children: [
                      Checkbox.adaptive(
                        activeColor: dailiPayColor,
                        value: agreed, 
                        onChanged: (v){
                          setState(() {
                            agreed = v!;
                          });
                        }),

                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "By continuing, you agree to our ",),
                      
                              TextSpan(
                                text: 'Terms of Service',
                                style: TextStyle(
                                  color: dailiPayColor
                                )
                              ),
                      
                              TextSpan(
                                text: ' and ',
                              ),
                      
                              TextSpan(
                                text: 'Privacy Policy.',
                                style: TextStyle(
                                  color: dailiPayColor
                                )
                              )
                            ]
                          )
                        ),
                      ),
                    ],
                  )

                  
                ],
              ), 

              DefaultButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context, 
                    PageTransition(
                      child: VerifyPhone(), 
                      type: PageTransitionType.rightToLeft));
                },
                label: 'Sign up')
            ],
          ),
        ),
      ),
    );
  }
}