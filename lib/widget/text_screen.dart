import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  var title;
  Color color;
  FontWeight fontWeight;
  double fontSize;

  CustomText({this.fontSize, this.fontWeight, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      title,
      style: GoogleFonts.montserrat(
          color: color, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
