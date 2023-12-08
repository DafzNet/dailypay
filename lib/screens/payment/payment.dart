import 'package:dailypay/screens/auth/login.dart';
import 'package:dailypay/utils/constants/colors.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/default.dart';
import 'package:dailypay/widgets/inputfields.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  final paymentTypeController = TextEditingController();
  bool addBen = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
      
                  const SizedBox(
                    height: 70,
                  ),
      
                  const TextInputField(
                    '0.0',
                    header: 'Enter Amount',
                  ),
                  
                  const SizedBox(
                    height: 25,
                  ),
      
                  TextInputField(
                    '',
                    header: 'Enter account to pay',
                    trailIcon: Icons.contacts,
                    controller: paymentTypeController,
                    trailIconColor: dailiPayColor,
                  ),

                  const SizedBox(
                    height: 25,
                  ),
      
                  TextInputField(
                    '',
                    header: 'Pay reference',
                    onTap: () async{
                    
                    },
                  ),

                  SizedBox(height: 10),

                  CheckboxListTile(
                    value: addBen,
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Add to Beneficiary List',
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                    onChanged: (v){
                      setState(() {
                        addBen = v!;
                      });
                    }
                  ),

                  
                  const SizedBox(
                    height: 75,
                  ),
      
                  DefaultButton(
                    label: 'Create Account',
      
                    color: dailiPayColor.shade300,
      
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: PinScreen(
                          label: 'Confirm'),
                      
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