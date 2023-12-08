import 'package:dailypay/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  final IconData? icon;
  final Color? iconColor;
  final Color? color;
  final Color? textColor;
  final String label;
  final VoidCallback? onTap;

  final TextStyle? textStyle;

  final Size? size;

  const DefaultButton({
    this.icon,
    this.textStyle,
    this.iconColor,
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
    return widget.icon == null ? TextButton(
      onPressed: widget.onTap,

      style: TextButton.styleFrom(
        backgroundColor: widget.color??dailiPayColor,
        fixedSize: widget.size?? Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      child:  Text(
        widget.label,

        style: widget.textStyle?? TextStyle(
          fontSize: 18,
          color: widget.textColor??Colors.black
        ),
      ),

      
    ):
    TextButton.icon(
      onPressed: widget.onTap,

      style: TextButton.styleFrom(
        backgroundColor: widget.color??dailiPayColor,
        fixedSize: widget.size?? Size(MediaQuery.of(context).size.width, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      icon: Icon(
        widget.icon,
        color: widget.iconColor??Colors.black,
      ),

      label:  Text(
        widget.label,

        style: widget.textStyle?? TextStyle(
          fontSize: 18,
          color: widget.textColor??Colors.black
        ),
      ),

      
    );
  }
}