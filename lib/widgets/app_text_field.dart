import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hint;
  final bool obscureText;
  final Color textColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;

  AppTextField({
    required this.textEditingController,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textColor = Colors.black,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // readOnly: true,
      // onTap: () {
      //   print('TextField Tapped');
      // },
      // maxLength: 45,
      // minLines: 1,
      // maxLines: 2,
      // expands: true,
      // minLines: null,
      // maxLines: null,

      // showCursor: true,
      // cursorWidth: 5,
      // cursorRadius: Radius.circular(10),
      // cursorColor: Colors.pink,
      // cursorHeight: 30,

      // onChanged: (value) {
      //   print(value);
      // },

      // buildCounter: (context, {required int currentLength,required bool isFocused, maxLength}) {
      //   return Text('{$currentLength : 45}');
      // },

      textDirection: TextDirection.ltr,
      textCapitalization: TextCapitalization.none,
      keyboardType: textInputType,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
        // counterText: '',
        // constraints: BoxConstraints(
        //   minHeight: 10,
        //   maxHeight: 40,
        // ),
        // contentPadding: EdgeInsetsDirectional.zero,
        contentPadding: EdgeInsetsDirectional.zero,

        hintText: hint,
        hintMaxLines: 1,
        hintTextDirection: TextDirection.ltr,
        hintStyle: TextStyle(color: Colors.grey),

        // labelText: 'Email',
        // labelStyle: TextStyle(color: Colors.grey),
        // floatingLabelBehavior: FloatingLabelBehavior.never,

        // fillColor: Colors.orange,
        // filled: true,

        prefixIcon: Icon(prefixIcon),
        // prefixText: 'ucas_',
        // prefixStyle: TextStyle(color: Colors.orange),
        // prefix: Icon(Icons.email),

        suffixIcon: Icon(suffixIcon),
        // suffixText: '@ucas.ps',

        enabled: true,
        // disabledBorder: InputBorder.none,
        disabledBorder: getBorder(borderColor: Colors.red.shade200),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(borderColor: Colors.blue),

        // helperText: 'username@ucas.ps',
        // helperStyle: TextStyle(color: Colors.grey),
        // helperMaxLines: 1,

        errorText: errorText,
        errorMaxLines: 1,
        errorBorder: getBorder(borderColor: Colors.red),
        focusedErrorBorder: getBorder(borderColor: Colors.red.shade800),
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1,
      ),
    );
  }
}
