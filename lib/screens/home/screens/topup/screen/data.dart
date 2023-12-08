import 'package:dailypay/screens/auth/login.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/default.dart';
import 'package:dailypay/widgets/inputfields.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  List<String> icons = [airtel, mtn, glo, nineMobile];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width-(bodyPadding*2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => 
              IconButton(
                onPressed: (){
          
                }, 
                icon: ClipOval(
                  child: SizedBox(
                    
                    child: Image.asset(
                      icons[index],
                    ),
                  ),
                ))),
            ),
          ),

          SizedBox(height: 40,),

          TextInputField(
            '0.00',
            header: 'Amount',
          ),

          SizedBox(height: 30,),

          TextInputField(
            '',
            header: 'Mobile Number',
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
    );
  }
}