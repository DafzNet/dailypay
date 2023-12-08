
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ResetPin extends StatefulWidget {
  const ResetPin({super.key});

  @override
  State<ResetPin> createState() => _ResetPinState();
}

class _ResetPinState extends State<ResetPin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(bodyPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Reset Your DailiPay PIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  height: 2
                ),
              ),

               Text(
                'We need to ask you couple of questions to make sure you’re the owner of the acoount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              SizedBox(
                height: 40,
              ),



              TextInputField(
                '',
                bgColor: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryColorLight,
                header: 'What is your Voter\'s card number?',
              ),

              SizedBox(height: 40,),


              TextInputField(
                '',
                header: 'When is your birthday?',
                bgColor: Theme.of(context).primaryColor,
                textColor: Theme.of(context).primaryColorLight,
              ),



              SizedBox(height: 100,),


              DefaultButton(label: 'Next')



            ],
          ),
        ),
      ),
    );
  }
}