import 'package:dailypay/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/constants/constants.dart';

class Onboarder extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final bool buttons;

  const Onboarder({
    this.title,
    this.subtitle,
    this.buttons = false,
    super.key});

  @override
  State<Onboarder> createState() => _OnboarderState();
}

class _OnboarderState extends State<Onboarder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 0,
      // ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-20,
            child: Image.asset(
              onboardingOne,

              fit: BoxFit.fitWidth,
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height/2)-10,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
                      .2,
                      .8
                    ],
                    colors: [
                      Colors.transparent,
                      Colors.black
                    ]
                  )
                ),

                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              logo,
                              width: 50,
                              height: 50,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: Text(
                                'DailiPay',
                            
                                style: GoogleFonts.poppins(color: dailiPayColor, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),

                      if(widget.title != null)...[
                      Text(
                        widget.title!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 30)
                      )],

                      if(widget.subtitle != null)...[
                      Text(
                        widget.subtitle!,
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 30)
                      )],

                    ],                  
                  ),
                ),
              ),

              Container(
                height: (MediaQuery.of(context).size.height/2)-10,

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black
                    ]
                  )
                ),

                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextInputField('hint'),
                      if(widget.buttons)...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RoundedIconButton(),

                          RoundedIconButton(),

                          RoundedIconButton()
                        ],
                      ),],

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: DefaultButton(
                          label: 'Sign Up',
                          color: Colors.white,
                        ),
                      ),

                      DefaultButton(
                        label: 'Log in',
                      ),

                      SizedBox(height: 15,)
                    ],
                  ),
                ),

              )
            ],
          )
        ],
      ),
    );
  }
}