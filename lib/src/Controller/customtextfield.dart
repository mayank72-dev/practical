import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customTextField(
    double width,
    TextEditingController controller,
    FormFieldValidator validator,
    FocusNode focusNode,


    String hintText,{double? height,  bool? obscureText , VoidCallback? onTap, String ? suffixIcon, int ?maxLength, bool ? readOnly,Color? cursorColor,Function(String?)? onSaved,String? prefixIcon}) {
  return SizedBox(
    width: width,
    child: TextFormField(
        cursorColor: cursorColor ?? Colors.black,
        readOnly: false,
        maxLength:maxLength ,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        obscureText: obscureText ?? false,
        onSaved: onSaved,

        decoration: InputDecoration(
            focusColor: Colors.grey,
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.green,width: 4)),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 4)),

            hintText: hintText,
            prefixIcon : prefixIcon != null ?Icon(Icons.email):null,
            fillColor: Colors.white,suffixIcon: suffixIcon!=null ? InkWell(onTap: onTap,child: const Icon (Icons.visibility_off)):null )),
  );
}