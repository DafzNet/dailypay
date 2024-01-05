import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/providers/theme_provider.dart';
import 'package:dailypay/screens/account/screens/referal.dart';
import 'package:dailypay/screens/account/screens/settings.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/utils/theme/dark.dart';
import 'package:dailypay/utils/theme/theme.dart';
import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

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
        title: Text('My Account'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(190),
                      border: Border.all(
                        color: Theme.of(context).primaryColorLight
                      )
                    ),
                  ),
        
                  Expanded(
                    child: Column(
                      children: [
                        Text('Rosemary Kolade', 
                        style: TextStyle(fontSize: 24)),
        
                        Text('Acct no: 12345678', 
                          style: TextStyle(fontSize: 16)
                        ),
                      ],
                    ),
                  )
                ],
              ),
        
              SizedBox(height: 20,),
        
              SwitchListTile(
                activeColor: dailiPayColor,
                title: Text(
                  'Enable Fingerprint/Face ID'
                ),
                value: fingerPrint, 
                onChanged: (v){
                  setState(() {
                    fingerPrint = v;
                  });
                }),
        
               SwitchListTile(
                activeColor: dailiPayColor,
                title: Text(
                  'Enable Dark Mode'
                ),
                value: darkMode, 
                onChanged: (v){
                  setState(() {
                    darkMode = v;
                  });
        
                  if (v==true) {
                    Provider.of<ThemeProvider>(context, listen: false).changeTheme(darkTheme, true);
                  } else {
                    Provider.of<ThemeProvider>(context, listen: false).changeTheme(lightTheme, false);
                  }
                  
                }),
        
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
                        color: dailiPayColor,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: EdgeInsets.all(10),
        
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Referral Earnings'
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            formatAsMoney(3000)
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
                            'DailiPay Points'
                          ),
        
                          SizedBox(height: 5,),
        
                          Text(
                            '12',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        
                SizedBox(height: 25,),
        
                AccountScreenButton(
                  label: 'My Account Settings',
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: AccountSettings(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),
        
                SizedBox(height: 15,),
        
                AccountScreenButton(
                  label: 'Schedule Withdrawal',
                  icon: MdiIcons.history,
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Container(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),
        
                SizedBox(height: 15,),
        
                AccountScreenButton(
                  label: 'Refer and Earn',
                  icon: Icons.sports_outlined,
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ReferralScreen(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),
        
        
                SizedBox(height: 15,),
        
                AccountScreenButton(
                  label: 'Bank Settings',
                  icon: MdiIcons.bank,
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Container(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),
        
                SizedBox(height: 15,),
        
                AccountScreenButton(
                  label: 'View DailiPay Librabry',
                  icon: MdiIcons.libraryOutline,
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Container(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),
        
        
                SizedBox(height: 15,),
        
                AccountScreenButton(
                  label: 'Contact Us',
                  icon: MdiIcons.contactsOutline,
        
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: Container(), 
                        type: PageTransitionType.rightToLeft
                      )
                    );
                  },
                ),

                SizedBox(height: 15,),

              AccountScreenButton(
                label: 'Log Out',
                icon: MdiIcons.logout,
                iconColor: Colors.redAccent,
                labelColor: Colors.redAccent,

                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: Container(), 
                      type: PageTransitionType.rightToLeft
                    )
                  );
                },
              ),

              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}