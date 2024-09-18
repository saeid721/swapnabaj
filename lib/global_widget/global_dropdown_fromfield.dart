import 'package:flutter/material.dart';
import 'colors.dart';
import 'input_decoration.dart';

class CustomDropDownFormField extends StatefulWidget {
  final String? titleText;
  final String? hintText;
  final String? labelText;
  final TextStyle? titleStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final String value;

  /// I can change this line
  final bool? filled;
  final Color? fillColor;
  final double? height;
  final double? menuMaxHeight;
  final bool? isDense;
  final List<String> items;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropDownFormField({
    super.key,
    this.titleText,
    this.labelText,
    this.hintText,
    this.titleStyle,
    this.labelTextStyle,
    this.hintTextStyle,
    required this.value,
    this.decoration,
    this.filled = false,
    this.fillColor,
    this.height,
    this.menuMaxHeight,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.sufixIcon,
    this.validator,
    this.contentPadding,
    this.isDense = false,
  });

  @override
  State<CustomDropDownFormField> createState() =>
      _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  String? selectValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText == null
            ? const SizedBox.shrink()
            : Text(
                widget.titleText ?? "",
                style: widget.titleStyle ??
                    const TextStyle(
                        color: ColorRes.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'),
                textAlign: TextAlign.center,
              ),
        widget.titleText != null
            ? const SizedBox(height: 5)
            : const SizedBox.shrink(),
        DropdownButtonFormField<String>(
          items: widget.items
              .map(
                (itemValue) => DropdownMenuItem<String>(
                  value: itemValue,
                  child: Text(
                    itemValue,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: ColorRes.textColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        fontFamily: 'Rubik'),
                  ),
                ),
              )
              .toList(),
          menuMaxHeight: widget.menuMaxHeight ?? 500,
          // value: widget.value, /// I can change this line
          value: selectValue,
          isExpanded: true,
          decoration: widget.decoration != null
              ? widget.decoration?.copyWith(
                  contentPadding: widget.contentPadding,
                  isDense: widget.isDense,
                  hintText: widget.hintText,
                  hintStyle: widget.hintTextStyle ??
                      const TextStyle(
                          fontSize: 12,
                          color: ColorRes.textColor,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Rubik'),
                  labelText: widget.labelText,
                  labelStyle: widget.labelTextStyle,
                  prefixIcon: widget.prefixIcon,
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                  // filled: true,
                  // fillColor: ColorRes.grey.withOpacity(0.2),
                )
              : inputDropDecoration.copyWith(
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                  isDense: widget.isDense,
                  hintText: widget.hintText,
                  hintStyle: widget.hintTextStyle ??
                      const TextStyle(
                          fontSize: 12,
                          color: ColorRes.textColor,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto'),
                  labelText: widget.labelText,
                  labelStyle: widget.labelTextStyle,
                  prefixIcon: widget.prefixIcon,
                  // filled: true,
                  // fillColor: ColorRes.grey.withOpacity(0.2),
                  filled: widget.filled,
                  fillColor: widget.fillColor,
                ),
          icon: widget.sufixIcon ??
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: ColorRes.textColor,
              ),
          onChanged: widget.onChanged,
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
            color: ColorRes.textColor,
          ),
        ),
      ],
    );
  }
}
