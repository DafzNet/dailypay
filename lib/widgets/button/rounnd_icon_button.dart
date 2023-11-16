import 'package:dailypay/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RoundedIconButton extends StatefulWidget {
  const RoundedIconButton({super.key});

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          ClipOval(
            child: Container(
              color: Colors.white,
              height: 70,
              width: 70,
              child: Icon(
                MdiIcons.cellphone,
                size: 40,
                color: dailiPayColor,
              ),
            ),
          ),

          SizedBox(height: 10,),

          Center(
            child: Text(
              'Touch to Payment',

              textAlign: TextAlign.center,
            ),
          )
          
        ],
      ),
    );
  }
}