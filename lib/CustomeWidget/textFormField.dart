import 'package:flutter/material.dart';

class customeTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  Color textColor;
  FontWeight fontWeight;
  Icon icons;
  bool obscuretext;

  Function ontap(TextEditingController ctrl) {
    this.controller = ctrl;
  }

  customeTextFormField({
    this.controller,
    this.hintText,
    this.textColor,
    this.fontWeight,
    this.obscuretext,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext ?? true,
      controller: controller,
      decoration: InputDecoration.collapsed(
        hintText: hintText ?? "",
        //border: UnderlineInputBorder(),
      ),
      style: TextStyle(
          //backgroundColor: Colors.yellow,
          color: textColor ?? Colors.white70,
          fontWeight: fontWeight ?? FontWeight.normal),
      onTap: ontap(controller),
    );
  }
}
