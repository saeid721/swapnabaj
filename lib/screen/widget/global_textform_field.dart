// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'colors.dart';
import 'global_image_loader.dart';
import 'global_sizedbox.dart';
import 'images.dart';
import 'input_decoration.dart';

class GlobalTextFormField extends StatefulWidget {
  final bool? enabled;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? titleText;
  final String? labelText;
  final String? hintText;
  final TextStyle? titleStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final InputDecoration? decoration;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? sufixIcon;
  final bool? filled;
  final Color? fillColor;
  final bool? obscureText;
  final String? obscuringCharacter;
  final bool isPasswordField;
  final bool? isRequired;
  final int? maxLine;
  final bool autofocus;
  final bool autocurrent;
  final bool? isDense;
  final Function? onChanged;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? Function(String?)? validator;
  const GlobalTextFormField({
    super.key,
    this.enabled,
    this.readOnly,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.titleText,
    this.labelText,
    this.hintText,
    this.titleStyle,
    this.labelTextStyle,
    this.hintTextStyle,
    this.decoration,
    this.prefixIcon,
    this.prefixIconColor,
    this.sufixIcon,
    this.suffixIconColor,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.obscureText,
    this.obscuringCharacter,
    this.maxLine,
    this.validator,
    this.onChanged,
    this.floatingLabelBehavior,
    this.isPasswordField = false,
    this.isRequired = false,
    this.autofocus = false,
    this.autocurrent = false,
    this.isDense = false,
  });

  @override
  State<GlobalTextFormField> createState() => _GlobalTextFormFieldState();
}

class _GlobalTextFormFieldState extends State<GlobalTextFormField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPasswordField) isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isRequired == false
            ? widget.titleText == null
                ? const SizedBox.shrink()
                : Text(
                    widget.titleText ?? "",
                    style: widget.titleStyle ??
                        const TextStyle(
                            color: ColorRes.primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rubik'),
                  )
            : SizedBox(
                child: Row(
                  children: [
                    widget.titleText == null
                        ? const SizedBox.shrink()
                        : Text(
                            widget.titleText ?? "",
                            style: widget.titleStyle ??
                                const TextStyle(
                                    color: ColorRes.primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Rubik'),
                          ),
                    sizedBoxW(2),
                    const Text(
                      "*",
                      style: TextStyle(
                          color: ColorRes.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rubik'),
                    ),
                  ],
                ),
              ),
        //   : GlobalText(
        // str: widget.titleText ?? "",
        // color: ColorRes.textColor,
        // fontSize: 16,
        // fontWeight: FontWeight.w400,
        // textAlign: TextAlign.center,
        // fontFamily: 'Rubik',
        // ),
        /// When I give the title text it will take the sizedbox
        widget.titleText != null
            ? const SizedBox(height: 5)
            : const SizedBox.shrink(),
        TextFormField(
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          autocorrect: widget.autocurrent,
          readOnly: widget.readOnly ?? false,
          enableIMEPersonalizedLearning: false,
          initialValue: widget.initialValue,
          controller: widget.controller,
          obscureText: widget.obscureText ?? isVisible,
          obscuringCharacter: widget.obscuringCharacter ?? "*",
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLine ?? 1,
          onChanged: (text) => widget.onChanged != null
              ? widget.onChanged!(text)
              : widget.onChanged,
          decoration: widget.decoration?.copyWith(
                isDense: widget.isDense,
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle ??
                    const TextStyle(
                        fontSize: 12,
                        color: ColorRes.secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik'),
                contentPadding: widget.contentPadding,
                labelText: widget.labelText,
                labelStyle: widget.labelTextStyle,
                prefixIcon: widget.prefixIcon,
                filled: widget.filled,
                fillColor: widget.fillColor,
                floatingLabelBehavior: widget.floatingLabelBehavior,

                /// When the visibility icon is neededIf isPasswordField is set-
                /// -to true in suffixIcon, auto visibility icon will appear
                suffixIcon: widget.isPasswordField
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          size: 18,
                          color: ColorRes.secondaryColor,
                        ),
                      )
                    : widget.sufixIcon,
              ) ??
              inputDecoration.copyWith(
                isDense: widget.isDense,
                hintText: widget.hintText,
                hintStyle: widget.hintTextStyle ??
                    const TextStyle(
                        fontSize: 12,
                        color: ColorRes.secondaryColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Rubik'),
                labelText: widget.labelText,
                labelStyle: widget.labelTextStyle,
                prefixIcon: widget.prefixIcon,
                // filled: true,
                // fillColor: ColorRes.grey.withOpacity(0.2),
                filled: widget.filled,
                fillColor: widget.fillColor,
                floatingLabelBehavior: widget.floatingLabelBehavior,

                /// When the visibility icon is neededIf isPasswordField is set-
                /// -to true in suffixIcon, auto visibility icon will appear
                suffixIcon: widget.isPasswordField
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: GlobalImageLoader(
                          imagePath: isVisible ? Images.eye1 : Images.eye1,
                          color: ColorRes.secondaryColor,
                        ),
                      )
                    : widget.sufixIcon,
              ),
          cursorColor: ColorRes.secondaryColor,
          validator: widget.validator ??
              (val) {
                if (val!.isEmpty) {
                  if (widget.labelText != null) {
                    return "${widget.labelText} is required!";
                  }
                  return "This filed is required!";
                }
                return null;
              },
          style: const TextStyle(
              color: ColorRes.secondaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 13,
              fontFamily: 'Rubik'),
        ),
      ],
    );
  }
}
