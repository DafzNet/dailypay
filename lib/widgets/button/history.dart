import 'package:dailypay/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/currency_format.dart';

class HistoryButton extends StatelessWidget {
  final VoidCallback? onTap;

  const HistoryButton({
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(10)
        ),
    
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'T-Fare',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                ),
                Text(
                formatAsMoney('30'),
    
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor
                  
                )
              ),
              ],
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yeesterday',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 12
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(7)
                  ),
                  child: Text(
                  'Successful',
                
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: dailiPayColor
                    
                  )
                            ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}