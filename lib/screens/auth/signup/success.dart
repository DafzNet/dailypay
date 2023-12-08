import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(bodyPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                 const Text(
                  'Welcome to cashless world. A world\nyou don’t need ATM or cash\nfor daily transactions.\n\nFast, Secured, & Convenient',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),


                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: dailiPayColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 20
                    )
                  ),
                  child: Icon(
                    MdiIcons.check,
                    size: 50,
                  )
                ),


                SizedBox(height: 60,),

                const Text(
                  'Successful',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(height: 30,),



              ],
            ),
          ),
        ),
      ),
    );
  }
}