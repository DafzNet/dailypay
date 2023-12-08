import 'package:dailypay/screens/auth/signup/get_started.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                  const Text(
                    'Enter the 4-digit code\nsent to your line:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  

                  Pinput(
                    obscureText: true,
                    separatorBuilder: (index) {
                      return const SizedBox(width: 25,);
                    },
                    focusedPinTheme: PinTheme(
                      width: 48,
                      height: 48,
                      
                      textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: dailiPayColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                    ),
                    defaultPinTheme: PinTheme(
                      width: 48,
                      height: 48,
                      
                      textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(246, 246, 246, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  const Text(
                    'Request New code in 00:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  TextButton(
                    onPressed: (){

                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: dailiPayColor
                      ),
                    )
                  )
                  
                  
                ],
              ), 

              DefaultButton(
                onTap: () {
                  Navigator.pushReplacement(
                    context, 
                    PageTransition(
                      child: GetStarted(),
                      type: PageTransitionType.bottomToTop));
                },
                label: 'Verify')
            ],
          ),
        ),
      ),
    );
  }
}