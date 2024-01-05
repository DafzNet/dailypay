import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReferralScreen extends StatefulWidget {
  const ReferralScreen({super.key});

  @override
  State<ReferralScreen> createState() => _ReferralScreenState();
}

class _ReferralScreenState extends State<ReferralScreen> {

  bool fingerPrint = false;
  bool darkMode = true;

  void darkM()async{
    final pref = await SharedPreferences.getInstance();
    String? t = pref.getString('theme');
    if (t != null && t == 'dark') {
      darkMode = true;
    } else {
      darkMode=false;
    }

    setState(() {
      
    });
  }

  @override
  void initState() {
    darkM();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Referral Earnings'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),

              Text(
                formatAsMoney(3000),

                style: GoogleFonts.roboto(
                  color: dailiPayColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
              ),

              SizedBox(
                  height: 20,
                ),
        
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width/2.3,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(10),
        
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pending Earnings',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor
                            ),
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            formatAsMoney(3000),

                            style: GoogleFonts.roboto(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
        
        
        
        
                    Container(
                      height: 90,
                      width: MediaQuery.of(context).size.width/2.3,
                      decoration: BoxDecoration(
                        color: dailiPayColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(10),
        
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Paid Earnings'
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            formatAsMoney(3000),

                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 25,),

                Row(
                  children: [
                    Text(
                      'Copy Referral Message'
                    ),
                  ],
                ),
        
                Container(
                  margin: EdgeInsets.only(top: 10),

                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Row(

                    children: [
                      Expanded(child: Container(

                      )),

                      Container(
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          color: dailiPayColor.shade100,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                          )
                        ),
                      )
                    ],
                  ),
                  
                ),



                SizedBox(height: 35,),

                Row(
                  children: [
                    Text(
                      'Pending'
                    ),
                  ],
                ),
        
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 10),

                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text(
                        'Referral bonus - Solomon Noah',

                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),

                      Text(
                        formatAsMoney(500),

                        style: GoogleFonts.roboto(color: Colors.black)
                      )
                     
                    ],
                  ),
                  
                )
            ],
          ),
        ),
      ),
    );
  }
}