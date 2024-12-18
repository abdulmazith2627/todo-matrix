import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  const FormText({super.key,required this.controller,required this.hintext,required this.maxLines});
final TextEditingController controller;
  final String  hintext;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      maxLines:maxLines,
      decoration:InputDecoration(
        border:OutlineInputBorder(),
        hintText: hintext,
      ),
    );
  }
}
