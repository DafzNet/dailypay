import 'package:dailypay/utils/constants/constants.dart';
import 'package:dailypay/widgets/button/account_screen_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Settings'
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
        child: ListView(
          children: [
            AccountScreenButton(
              label: 'Profile Settings',

              onTap: () {
                
              },
            ),

            SizedBox(height: 15,),

            AccountScreenButton(
              label: 'Update Security question',
              icon: MdiIcons.chatQuestionOutline,

              onTap: () {
                
              },
            ),

            SizedBox(height: 15,),

            AccountScreenButton(
              label: 'Next of Kin',
              icon: MdiIcons.human,

              onTap: () {
                
              },
            ),

            SizedBox(height: 15,),

            AccountScreenButton(
              label: 'Change Transaction Pin',
              icon: Icons.settings_suggest_outlined,

              onTap: () {
                
              },
            ),

            SizedBox(height: 15,),

            AccountScreenButton(
              label: 'Update KYC',
              icon: Icons.assignment_ind_outlined,

              onTap: () {
                
              },
            )
          ],
        ),
      ),
    );
  }
}