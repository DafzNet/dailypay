import 'package:dailypay/utils/constants/constants.dart';
import 'package:flutter/material.dart';

SnackBar dailiPaySnack(msg) {
    return SnackBar(
            backgroundColor: dailiPayColor.shade200,
            content: Text(
              msg,
              style: TextStyle(
                color: Colors.white
              ),
            )
          );
  }
