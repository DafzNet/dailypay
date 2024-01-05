import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountScreenButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String label;
  final Color? labelColor;
  final Color? iconColor;

  const AccountScreenButton({
    this.icon,
    required this.label,
    this.iconColor,
    this.labelColor,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: .2, color: Colors.black12)
        ),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon??Icons.manage_accounts_outlined,
                    color: iconColor?? Colors.black,
                    size: 30,
                  ),

                  SizedBox(width: 10,),

                  Text(
                    label,

                    style: TextStyle(
                      color: labelColor??Colors.black
                    ),
                  )
                ],
              ),

              Icon(
                MdiIcons.chevronRight,
                color:Colors.black,
                size: 30,
              ),              
            ],
          ),
        ),
      ),
    );
  }
}