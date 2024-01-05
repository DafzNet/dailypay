import 'package:dailypay/screens/auth/signup/verify_phone.dart';
import 'package:dailypay/services/services.dart';
import 'package:dailypay/widgets/loading.dart';
import 'package:dailypay/widgets/snack.dart';
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
  final _client = DailyHttpClient();

  bool agreed = false;
  bool loading = false;

  bool enabled(){
    return agreed && int.tryParse(phoneNo.text)!=null && phoneNo.text.length >= 10 && phoneNo.text.length <=12 && phoneNo.text.startsWith(RegExp(r'090|080|070|091|081|071|81|91|71'));
  }

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
                      onChanged: (p0) {
                        setState(() {
                          
                        });
                      },
                      
                      keyboardType: TextInputType.number,
                      controller: phoneNo,
                      textColor: Colors.black,
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

                              setState(() {
                                
                              });
                            });
                          }),
          
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "By continuing, you agree to our ",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight
                                  )
                                ),
                        
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
                  active: enabled(),
                  onTap: () async{

                    setState(() {
                      loading = true;
                    });

                    try {
                      final res = await _client.post(
                        'auth/verify-phone',
                        {
                          "phone_number": phoneNo.text
                        },
                      );

                      print(res);

                      if (res['status']) {
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          dailiPaySnack(res['message'])
                        );
                        Navigator.pushReplacement(
                          context, 
                          PageTransition(
                            child: VerifyPhone(
                              phone: phoneNo.text,
                            ), 
                            type: PageTransitionType.rightToLeft));
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

                        print(e);
                    }
                  },
                  label: 'Sign up')
              ],
            ),
          ),
        ),
      ),
    );
  }
}