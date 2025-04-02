import 'package:flutter/material.dart';
import 'package:pixelecomapp/src/core/utils/constant/util.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: scaledWidth(context),
      color: Colors.redAccent,
      child: Center(
        child: Text(
          "No internet connection",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
