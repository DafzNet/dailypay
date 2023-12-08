import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/screens/home/screens/history/history.dart';
import 'package:dailypay/screens/home/screens/notification.dart';
import 'package:dailypay/screens/home/screens/scan/receive.dart';
import 'package:dailypay/screens/home/screens/scan/send.dart';
import 'package:dailypay/screens/home/screens/support/support.dart';
import 'package:dailypay/screens/home/screens/topup/topup.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'screens/withdraw.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(bodyPadding),
        child: Column(
          children: [

            SafeArea(child: SizedBox(),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Welcome Shola',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),

                    children: [
                      TextSpan(
                        text: '\nWhat are you paying for today?',
                        style: TextStyle(
                          fontSize: 16,
                          //fontWeight: FontWeight.w700
                        ),
                      )
                    ]
                  ),
                  
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: null,
                      iconSize: 30,
                      icon: Icon(
                        MdiIcons.qrcode,
                        color: dailiPayColor,
                      )),

                      IconButton(
                      onPressed: (){
                        Navigator.push(context, 
                        PageTransition(
                          child: NotificationScreen(), 
                          type: PageTransitionType.fade)
                        );
                      },
                      iconSize: 30,
                      icon: Icon(
                        MdiIcons.bell,
                        color: Theme.of(context).primaryColorLight,
                      ))
                  ],
                )
              ],
            ),

            SizedBox(height: 20,),

            Container(
              decoration: BoxDecoration(
                color: dailiPayColor.shade400,
                borderRadius: BorderRadius.circular(15)
              ),
              height: 150,
              
              child: Stack(
                children: [
                  Positioned(
                    right: -120,
                    child: Opacity(

                      opacity: .5,
                      child: Image.asset(
                        logo,
                        fit: BoxFit.fitHeight,
                        height: 150,
                      ),
                    )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Row(),
                        Text(
                          'DailiPay Wallet Balance',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),

                        Text(
                          formatAsMoney(5000),
                          style: GoogleFonts.roboto(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          )
                        ),

                        Text(
                          'DailiPay account: 12345678',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DefaultButton(
                  icon: MdiIcons.send,
                  color: Theme.of(context).primaryColorLight,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Withdraw(),
                        type: PageTransitionType.fade
                      )
                    );
                  },
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),
                  size: Size(MediaQuery.of(context).size.width/2.2, 40),
                  label: 'Withdraw'),

                DefaultButton(

                  onTap: () async{
                    await showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context, 
                      builder: (context){
                        return SizedBox(
                          height: MediaQuery.of(context).size.height/1.5,
                          child: Stack(

                            children: [
                              Positioned(
                                top: 5,
                                right: 1,
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, 
                                  icon: Icon(
                                    Icons.close, color: Colors.red,
                                  ))
                                ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: SendScan(),
                                          type: PageTransitionType.fade
                                        )
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColorLight,
                                      minimumSize: Size(MediaQuery.of(context).size.width-40, 50),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    ),
                                    child: Text(
                                      'Send Money',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16
                                      ),
                                    ) 
                                  ),

                                  SizedBox(height: 30,),


                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: ReceiveScan(),
                                          type: PageTransitionType.fade
                                        )
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Theme.of(context).primaryColorLight,
                                      minimumSize: Size(MediaQuery.of(context).size.width-40, 50),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                                    ),
                                    child: Text(
                                      'Receive Money',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16
                                      ),
                                    ) 
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    );
                  },
                  icon: MdiIcons.scanner,
                  textStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),

                  color: Theme.of(context).primaryColorLight,
                  size: Size(MediaQuery.of(context).size.width/2.2, 40),
                  label: 'Scan to Pay'),
              ],
            ),

            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                
                RoundedIconButton(
                  icon: MdiIcons.cellphone,
                  label: 'Top-up',

                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Topup(), 
                        type: PageTransitionType.fade)  
                    );
                  },
                ),

                RoundedIconButton(
                  icon: MdiIcons.history,
                  label: 'Transaction Details',
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: History(), 
                        type: PageTransitionType.fade)  
                    );
                  },
                ),
                RoundedIconButton(
                  icon: MdiIcons.mapMarkerCircle,
                  label: 'Agent Locations',
                ),
              ],
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: 
              MainAxisAlignment.spaceAround,
              children: [
                
                RoundedIconButton(
                  icon: MdiIcons.accountCardOutline,
                  label: 'My Support Manager',

                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Support(),
                        type: PageTransitionType.fade
                      )
                    );
                  },
                ),

                SizedBox(width: 80,),

                SizedBox(width: 80,),
              ],
            )
          ],
        ),
      ),
    );
  }
}