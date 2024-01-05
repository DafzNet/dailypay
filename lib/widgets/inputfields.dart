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
  final Color? textColor;
  final String? header;
  final String? footer;
  final Color? trailIconColor;

  final Function(String)? onChanged;
  final TextInputType keyboardType;


  const TextInputField(
    this.hint,
    {
    this.controller,
    this.onChanged,
    this.trailIconColor,
    this.keyboardType = TextInputType.text,
    this.header,
    this.onTap,
    this.textColor,
    this.buttonType=false,
    this.password=false,
    this.trailIcon,
    this.footer,
    this.bgColor,
    super.key});

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  
  bool showPwd = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(widget.header != null)...[
          Row(
            children: [
              Text(
                widget.header!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),

          SizedBox(height: 10,)
        ],


        GestureDetector(
          onTap: () {
            if (widget.buttonType) {
              widget.onTap!();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Theme.of(context).primaryColor == Colors.black? Colors.white:Colors.black
              ),
              color: widget.bgColor??Colors.white
            ),
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: widget.buttonType || widget.password || widget.trailIcon != null? MediaQuery.of(context).size.width-75 : MediaQuery.of(context).size.width-46,
                    child: TextField(
                      controller: widget.controller,
                      keyboardType: widget.keyboardType,
                      onChanged: widget.onChanged,
                      obscureText: widget.password&&showPwd,
                      enabled: !widget.buttonType,
                      style: GoogleFonts.poppins(color: widget.textColor ??Colors.black, fontSize: 14),
                      decoration: InputDecoration.collapsed(
                        hintText: widget.hint,
                        hintStyle: GoogleFonts.poppins(color: widget.textColor ?? Colors.black, fontSize: 16)
                        
                      )
                    ),
                  ),
        
                  if(widget.buttonType || widget.trailIcon != null)...[
                    Icon(
                      widget.trailIcon??MdiIcons.chevronDown,
                      color: widget.trailIconColor?? Colors.black,
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
          ),
        ),

        if(widget.footer != null)...[
          SizedBox(height: 10,),
          Row(
            children: [
              Text(
                widget.footer!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),

          
        ],
      ],
    );
  }
}