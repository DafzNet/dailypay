import 'package:dailypay/screens/auth/login.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/default.dart';
import 'package:dailypay/widgets/inputfields.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Withdraw extends StatefulWidget {
  const Withdraw({super.key});

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {

  final paymentTypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
      
                  const SizedBox(
                    height: 80,
                  ),
      
                  const TextInputField(
                    '0.0',
                    header: 'Enter amount to withdraw',
                  ),
                  
                  const SizedBox(
                    height: 35,
                  ),
      
                  TextInputField(
                    'Select bank',
                    header: 'Select destination',
                    buttonType: true,
                    controller: paymentTypeController,
                    onTap: () async{
                      await showModalBottomSheet(
                        context: context, 
                        builder: (ctx){
                          return Container(
                            height: 200,
                            child: ListView(
                              children: [
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      paymentTypeController.text='Card';
                                    });
                                    Navigator.pop(ctx);
                                  },
                                  title: Text(
                                    'Bank'
                                  ),
                                ),

                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      paymentTypeController.text='Card';
                                    });
                                    Navigator.pop(ctx);
                                  },
                                  title: Text(
                                    'Card'
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                    },
                  ),

                  const SizedBox(
                    height: 35,
                  ),
      
                  const TextInputField(
                    '1234...',
                    header: 'Bank account number',
                  ),
                  
                  const SizedBox(
                    height: 95,
                  ),
      
                  DefaultButton(
                    label: 'Proceed',
      
                    color: dailiPayColor.shade300,
      
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: PinScreen(label: 'Confirm'), 
                          type: PageTransitionType.fade)
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}