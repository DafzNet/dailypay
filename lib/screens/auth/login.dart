import 'package:dailypay/screens/auth/resetpin.dart';
import 'package:dailypay/screens/nav.dart';
import 'package:dailypay/services/services.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/loading.dart';
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

  final phoneController = TextEditingController();
  final passController = TextEditingController();

  bool loading = false;


  bool enabled() => int.tryParse(phoneController.text)!=null && phoneController.text.length >= 10 && phoneController.text.length <=11 && phoneController.text.startsWith(RegExp(r'090|080|070|091|081|071|81|91|71')) && passController.length>=8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Center(
          child: LoadingIndicator(
            loading: loading,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Enter your DailiPay Details'
                    ),
          
                    const SizedBox(
                      height: 50,
                    ),
          
                    
          
                    TextInputField(
                      'phone number',
                      controller: phoneController,

                      onChanged: (p0) {
                        setState(() {
                          
                        });
                      },
                    ),
          
                    const SizedBox(
                      height: 30,
                    ),
          
                    TextInputField(
                      'password',
                      controller: passController,
                      password: true,
                      onChanged: (p0) {
                        setState(() {
                          
                        });
                      },
                    )
                    
                    // Pinput(
                    //   obscureText: true,
                    //   separatorBuilder: (index) {
                    //     return const SizedBox(width: 25,);
                    //   },
                    //   focusedPinTheme: PinTheme(
                    //     width: 48,
                    //     height: 48,
                        
                    //     textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(
                    //         color: dailiPayColor),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //   ),
                    //   defaultPinTheme: PinTheme(
                    //     width: 48,
                    //     height: 48,
                        
                    //     textStyle: GoogleFonts.poppins(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       border: Border.all(
                    //         color: Theme.of(context).primaryColorLight),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //   ),
                    // ),
                  ],
                ), 
          
                DefaultButton(
                  label: widget.label,
                  active: enabled(),

                  onTap: widget.onTap?? () async{

                    setState(() {
                      loading =true;
                    });

                    final _client = DailyHttpClient();

                    var res = await _client.post(
                      'auth/account-login', 
                      {
                        "phone_number": phoneController.text,
                        "password": passController.text
                      }
                    );

                    print(res);


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
      ),
    );
  }
}