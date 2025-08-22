import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData ?prefixIcon;
  final IconData?suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
     this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 48,
      child: TextField(scrollPadding: EdgeInsets.zero,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14,color: Color(0xFF929292,),fontWeight: FontWeight.w400),
          suffixIcon: Icon(suffixIcon,size: 16,color: Color(0xFFB1B3B4),),
          prefixIcon: Icon(prefixIcon,size: 16,color: Color(0xFFB1B3B4),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFFB1B3B4),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFFB1B3B4),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(
              color: Color(0xFFB1B3B4),
              width: 1,
            ),
          ),
        ),
      ),
    );

  }
}
