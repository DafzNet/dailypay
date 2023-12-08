import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/screens/home/screens/history/summary.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text(
                'DailiPay Wallet Balance'
              ),
            ),

            SizedBox(height: 10,),

            Text(
              '548989909'
            ),

             SizedBox(height: 10,),

            Text(
              formatAsMoney('376088'),

              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: dailiPayColor
              )
            ),

            SizedBox(height: 20,),


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HistoryButton(
                      onTap: (){
                        Navigator.push(context, 
                        PageTransition(
                          child: HistorySummary(), 
                          type: PageTransitionType.rightToLeft));
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}