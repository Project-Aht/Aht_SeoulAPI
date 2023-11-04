import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      textScaleFactor: 0.85,
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final bool? obscureText;
  final String? obscuringCharacter;
  final int? maxLength;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final void Function(String)? onChanged;
  final int? maxLines;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.textAlign,
    this.textInputAction,
    this.decoration,
    this.keyboardType,
    this.style,
    this.obscureText,
    this.obscuringCharacter,
    this.maxLength,
    this.maxLines,
    this.onChanged,
    this.onSubmitted,
    this.scrollPhysics,
    this.scrollController,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context);
    final mqDataNew = mqData.copyWith(textScaleFactor: 0.85);
    return MediaQuery(
      data: mqDataNew,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign ?? TextAlign.start,
        textInputAction: textInputAction,
        cursorColor: Colors.black,
        decoration: decoration,
        keyboardType: keyboardType,
        style: style,
        obscureText: obscureText ?? false,
        obscuringCharacter: obscuringCharacter ?? '•',
        maxLength: maxLength,
        maxLines: maxLines,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        scrollPhysics: scrollPhysics,
        scrollController: scrollController,
        controller: controller,
      ),
    );
  }
}
