import 'package:dailypay/utils/constants/colors.dart';
import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/default.dart';
import 'package:dailypay/widgets/inputfields.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FundWallet extends StatefulWidget {
  const FundWallet({super.key});

  @override
  State<FundWallet> createState() => _FundWalletState();
}

class _FundWalletState extends State<FundWallet> {

  final paymentTypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund Wallet'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: Column(
          children: [
      
                  const SizedBox(
                    height: 80,
                  ),
      
                  const TextInputField(
                    '0.0',
                    header: 'Enter Amount',
                  ),
                  
                  const SizedBox(
                    height: 35,
                  ),
      
                  TextInputField(
                    'Select',
                    header: 'Choose payment type',
                    buttonType: true,
                    controller: paymentTypeController,
                    onTap: () async{
                      await showModalBottomSheet(
                        context: context, 
                        builder: (ctx){
                          return Container(
                            height: 200,
                            child: ListView(
                              children: [
                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      paymentTypeController.text='Card';
                                    });
                                    Navigator.pop(ctx);
                                  },
                                  title: Text(
                                    'Bank'
                                  ),
                                ),

                                ListTile(
                                  onTap: () {
                                    setState(() {
                                      paymentTypeController.text='Card';
                                    });
                                    Navigator.pop(ctx);
                                  },
                                  title: Text(
                                    'Card'
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                    },
                  ),
                  
                  const SizedBox(
                    height: 95,
                  ),
      
                  DefaultButton(
                    label: 'Create Account',
      
                    color: dailiPayColor.shade300,
      
                    onTap: () {
                      
                    },
                  ),
          ],
        ),
      ),
    );
  }
}