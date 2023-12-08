import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HistorySummary extends StatefulWidget {
  const HistorySummary({super.key});

  @override
  State<HistorySummary> createState() => _HistorySummaryState();
}

class _HistorySummaryState extends State<HistorySummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Successful'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Center(
              child: Text(
                'Transaction Successful'
              ),
            ),
        
            SizedBox(height: 30,),
        
        
        
            Text(
              formatAsMoney('376088'),
        
              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: dailiPayColor
              )
            ),
        
            SizedBox(height: 40,),
        
        
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColorLight
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Paid on',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            ),
                      
                            Text(
                              DateFormat('dd MMM y, HH:mm').format(DateTime.now()),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sender',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            ),
                      
                            Text(
                              'Zest Ebiondo',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Beneficiary',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            ),
                      
                            Text(
                              'Ebiondo Daniel',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'DailiPay Account',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            ),
                      
                            Text(
                              '1234567',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14
                              ),
                            )
                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: (){

                              }, 
                              style: TextButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                minimumSize: Size(140, 40),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              child: Text(
                                  'Rate our Service',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                      
                            TextButton(
                              onPressed: (){

                              },
                              style: TextButton.styleFrom(
                                backgroundColor: dailiPayColor.shade300,
                                minimumSize: Size(140, 40),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                              ),
                              child: Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}