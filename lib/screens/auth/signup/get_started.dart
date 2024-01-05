import 'package:dailypay/screens/auth/signup/success.dart';
import 'package:dailypay/services/services.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/loading.dart';
import 'package:dailypay/widgets/snack.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GetStarted extends StatefulWidget {
  final String phone;
  const GetStarted({
    required this.phone,
    super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  bool loading = false;
  final _client = DailyHttpClient();


  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final pinController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

  bool enabled(){
    return RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(emailController.text)&&
      firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty&&
      genderController.text.isNotEmpty&&addressController.text.isNotEmpty&&
      pinController.text.length==4&&passController.text == confirmController.text && passController.text.length>=8;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(bodyPadding),
            child: LoadingIndicator(
              loading: loading,
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
            
                  TextInputField(
                    'Email',
                    controller: emailController,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
            
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField(
                    'First Name',
                    controller: firstNameController,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField(
                    'Last Name',
                    controller: lastNameController,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField(
                    'Gender',
                    controller: genderController,
                    buttonType: true,

                    onTap: ()async{
                      await showModalBottomSheet(
                        context: context, 
                        builder: ((context) {
                          return Container(
                            padding: EdgeInsets.all(24),
                            height: 200,
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Male'),
                                  onTap: () {
                                    genderController.text = 'male';

                                    Navigator.pop(context);
                                  },
                                ),

                                ListTile(
                                  title: Text('Female'),
                                  onTap: () {
                                    genderController.text = 'female';
                                  },
                                ),
                              ],
                            ),
                          );
                        })
                        );
                    },
                    onChanged: (p0) {
                      setState(() {
                        
                      });


                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField(
                    'Address',

                    controller: addressController,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField('Pin',
                  controller: pinController,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField(
                    'Password',
                    controller: passController,
                    password: true,
                    onChanged: (p0) {
                      setState(() {
                        
                      });
                    },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  TextInputField('Confirm Password',
                    controller: confirmController,
                    password: true,
                      onChanged: (p0) {
                        setState(() {
                          
                        });
                      },
                  ),
                  
                  const SizedBox(
                    height: 15,
                  ),
            
                  DefaultButton(
                    label: 'Create Account',
                    active: enabled(),
                    color: dailiPayColor.shade300,
            
                    onTap: () async{

                      setState(() {
                        loading = true;
                      });

                      try {
                        var res = await _client.post(
                        'auth/${widget.phone.toString()}/add-details',
                        {
                          "email": emailController.text,
                          "password": passController.text,
                          "first_name": firstNameController.text,
                          "last_name": lastNameController.text,
                          "user_pin": pinController.text,
                          "address": addressController.text,
                          "gender": genderController.text.toLowerCase(),
                          "role": "user"
                        }  
                      );
                      
                      print(res);

                      if (res['status']) {  
                        setState(() {
                          loading = false;
                        });

                        Navigator.pushReplacement(
                        context,
                        PageTransition(
                          child: SuccessScreen(
                            
                          ), 
                          type: PageTransitionType.fade
                        )
                      );  
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
      ),
    );
  }
}