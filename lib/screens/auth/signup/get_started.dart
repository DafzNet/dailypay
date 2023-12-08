import 'package:dailypay/screens/auth/signup/success.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(bodyPadding),
            child: Column(
              children: [
                const Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
                 const Text(
                  'Let\'s setup your dailypay wallet and start to enjoy stressless daily payment for t-fare, food and other petty things',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),

                const TextInputField('Email'),

                const SizedBox(
                  height: 15,
                ),

                const TextInputField('First Name'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Last Name'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Gender'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Address'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Pin'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Password'),
                
                const SizedBox(
                  height: 15,
                ),

                const TextInputField('Confirm Password'),
                
                const SizedBox(
                  height: 15,
                ),

                DefaultButton(
                  label: 'Create Account',

                  color: dailiPayColor.shade300,

                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: SuccessScreen(
                          
                        ), 
                        type: PageTransitionType.fade
                      )
                    );
                  },
                ),

                const SizedBox(
                  height: 15,
                ),



                const Text(
                  'Already have an account? ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}