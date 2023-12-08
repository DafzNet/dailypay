import 'package:dailypay/controllers/currency_format.dart';
import 'package:dailypay/screens/home/screens/history/summary.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceiveScan extends StatefulWidget {
  const ReceiveScan({super.key});

  @override
  State<ReceiveScan> createState() => _ReceiveScanState();
}

class _ReceiveScanState extends State<ReceiveScan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan to Receive'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Text(
                'Scan QR Code'
              ),
            ),

            QrImageView(
              data: '1234567890',
              version: QrVersions.auto,
              size: 200.0,
              backgroundColor: Colors.white,
            ),


            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColorLight,
                  minimumSize: Size(MediaQuery.of(context).size.width/3, 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16
                  ),
                )
              )
            ),


            SizedBox(height: 40,)
            

          ],
        ),
      ),
    );
  }
}