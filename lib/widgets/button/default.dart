import 'package:dailypay/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final IconData? icon;
  final Color? color;
  final Color? textColor;
  final String label;
  final VoidCallback? onTap;

  final Size? size;

  const DefaultButton({
    this.icon,
    this.onTap,
    required this.label,
    this.color,
    this.textColor,
    this.size,
    super.key});

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onTap,

      style: TextButton.styleFrom(
        backgroundColor: widget.color??dailiPayColor,
        fixedSize: widget.size?? Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      child:  Text(
        widget.label,

        style: TextStyle(
          fontSize: 18,
          color: widget.textColor??Colors.black
        ),
      ),

      
    );
  }
}