import 'package:dailypay/screens/auth/resetpin.dart';
import 'package:dailypay/screens/nav.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class PinScreen extends StatefulWidget {
  final VoidCallback? onTap;
  final String label;

  const PinScreen({
    required this.label,
    this.onTap,

    super.key});

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter your DailiPay Pin'
                  ),

                  const SizedBox(
                    height: 50,
                  ),
                  
                  Pinput(
                    obscureText: true,
                    separatorBuilder: (index) {
                      return const SizedBox(width: 25,);
                    },
                    focusedPinTheme: PinTheme(
                      width: 48,
                      height: 48,
                      
                      textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
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
                      
                      textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color.fromRGBO(246, 246, 246, 1)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                    ),
                  ),
                ],
              ), 

              DefaultButton(
                label: widget.label,
                onTap: widget.onTap?? () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: AppBaseNavigation(), 
                      type: PageTransitionType.fade 
                    )
                  );
                },
                )
            ],
          ),
        ),
      ),
    );
  }
}