import 'package:flutter/material.dart';



class CustomLabelText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color? color;
  
  
  const CustomLabelText({super.key,required this.text,this.fontsize = 12, this.color });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: TextStyle(
          fontSize: fontsize,
          color: Colors.black54,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600
        ),
    );
  }
}