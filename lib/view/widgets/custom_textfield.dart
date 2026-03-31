
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {

 TextEditingController controller;
    final String label;
    TextInputType keyboardType = TextInputType.text;
    bool obscureText = false;

     IconData? icon;
    Widget? Suffixicon;


 

  CustomTextField({
    super.key, required this.label,
    required this.controller,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.Suffixicon,  
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(icon, color: Colors.grey.shade300),
          labelText: label,
          suffixIcon: Suffixicon,
          labelStyle: TextStyle(color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
    
    
    
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(labelText, style: AppTextStyles.labelstyle),
    //     const SizedBox(height: 8.0),
    //     TextField(
    //       controller: controller,
    //       obscureText: obscureText,
    //       decoration: InputDecoration(
    //         hintText: hintText,
    //         suffixIcon: Icon(iconData),
    //         hintStyle: AppTextStyles.hintstyle,
    //         filled: true,
    //         fillColor: AppColors.filledcolor,
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.circular(8.0),
    //           borderSide: BorderSide.none,
    //         ),
    //         contentPadding: const EdgeInsets.symmetric(
    //           horizontal: 16,
    //           vertical: 14,
    //         ),
    //       ),
    //     ),
    //     const SizedBox(height: 16.0),
    //   ],
    // );
  }
}
