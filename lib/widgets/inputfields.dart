import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TextInputField extends StatefulWidget {
  final bool password;
  final bool buttonType;
  final String hint;
  final IconData? trailIcon;
  final Color? bgColor;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const TextInputField(
    this.hint,
    {
    this.controller,
    this.onTap,
    this.buttonType=false,
    this.password=true,
    this.trailIcon,
    this.bgColor,
    super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  
  bool showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor == Colors.black? Colors.white:Colors.black
        ),
        color: widget.bgColor??Colors.white
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: widget.buttonType || widget.password ? MediaQuery.of(context).size.width-75 : MediaQuery.of(context).size.width-46,
              child: TextField(
                controller: widget.controller,
                obscureText: widget.password&&showPwd,
                enabled: !widget.buttonType,
                style: GoogleFonts.poppins(color: Theme.of(context).primaryColor, fontSize: 14),
                decoration: InputDecoration.collapsed(
                  hintText: widget.hint,
                  hintStyle: GoogleFonts.poppins(color: Theme.of(context).primaryColor, fontSize: 16)
                  
                )
              ),
            ),

            if(widget.buttonType)...[
              Icon(
                widget.trailIcon??MdiIcons.chevronDown,
                color: Colors.black,
                size: 28,
              ),],

            if(widget.password)...[
              GestureDetector(
                onTap: () {
                  setState(() {
                    showPwd = !showPwd;
                  });
                },
                child: Icon(
                  showPwd?MdiIcons.eyeOutline:MdiIcons.eyeOffOutline,
                  color: Colors.black,
                  size: 28,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}