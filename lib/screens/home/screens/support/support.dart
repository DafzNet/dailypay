import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/screens/home/screens/history/summary.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text(
                'Support Manager'
              ),
            ),

            SizedBox(height: 20,),

            Text(
              'ZIBA',

              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: dailiPayColor
              )
            ),

            SizedBox(height: 20,),


            ClipOval(
              child: Container(
                width: 100,
                height: 100,
                color: Theme.of(context).primaryColorLight,
              ),
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: (){

                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    minimumSize: Size(120, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  icon: Icon(
                    MdiIcons.phonePlusOutline,
                    color: Theme.of(context).primaryColor,
                  ), 
                  label: Text(
                    'Call',

                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ),



                TextButton.icon(
                  onPressed: (){
                    
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    minimumSize: Size(120, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  icon: Icon(
                    MdiIcons.emailPlusOutline,
                    color: Theme.of(context).primaryColor,
                  ), 
                  label: Text(
                    'Email',

                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}