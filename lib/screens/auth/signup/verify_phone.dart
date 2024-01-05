import 'package:dailypay/screens/auth/signup/get_started.dart';
import 'package:dailypay/services/services.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/loading.dart';
import 'package:dailypay/widgets/snack.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class VerifyPhone extends StatefulWidget {
  final String phone; 
  const VerifyPhone({
    required this.phone,
    super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {

  final otpController = TextEditingController();

  bool loading = false;

  bool enabled(){
    return otpController.text.length == 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Center(
          child: LoadingIndicator(
            loading: loading,
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

                      onChanged: ((value){
                        setState(() {
                          
                        });
                      }),
                      controller: otpController,
                      focusedPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        
                        textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: dailiPayColor),
                            borderRadius: BorderRadius.circular(7),
                          ),
                      ),

                      defaultPinTheme: PinTheme(
                        width: 48,
                        height: 48,
                        
                        textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight),
                            borderRadius: BorderRadius.circular(7),
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
                  active: enabled(),
                  onTap: () async{

                    setState(() {
                      loading = true;
                    });
                    

                    final _client = DailyHttpClient();

                    try {
                                          var res = await _client.post(
                      'auth/verify-account',
                      {
                        "phone_number": widget.phone,
                        "code": otpController.text
                      }
                    );

                    print(res);

                    if (res['status'] == true) {
                      setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          dailiPaySnack(res['message'])
                        );

                      Navigator.pushReplacement(
                      context, 
                      PageTransition(
                        child: GetStarted(phone: widget.phone,),
                        type: PageTransitionType.bottomToTop));
                    } else {
                       setState(() {
                          loading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          dailiPaySnack(res['message']??'Oops! something went wrong')
                        );
                    }
                    } catch (e) {
                      setState(() {
                          loading = false;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          dailiPaySnack('Oops! something went wrong')
                        );
                    }
                    
                    
                  },
                  label: 'Verify')
              ],
            ),
          ),
        ),
      ),
    );
  }
}