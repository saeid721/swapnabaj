import 'package:flutter/material.dart';
import 'colors.dart';

class ChapterItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  final String? leadingImage; // New optional leading image parameter
  final Color? leadingImageColor; // New optional color for leading image
  final Color backgroundColor;

  const ChapterItem({
    required this.title,
    required this.onTap,
    this.icon = Icons.arrow_forward_ios, // Default trailing icon
    this.leadingImage, // Accept leadingImage as an optional parameter
    this.leadingImageColor, // Accept leadingImageColor as an optional parameter
    this.backgroundColor = ColorRes.backgroundColor, // Default background color
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent, // Use transparent color in Material
        elevation: 2.0, // Add elevation to create a shadow effect
        shadowColor: Colors.black.withOpacity(0.25), // Optional: Adjust shadow color and opacity
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ), // Apply the same border radius to the shadow
        child: Container(
          padding: const EdgeInsets.all(8.0), // Add padding around the content
          decoration: BoxDecoration(
            color: backgroundColor, // Set the background color here
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
            ), // Add top-right and bottom-left border radius
            border: const Border(
              bottom: BorderSide(
                color: ColorRes.borderColor, // Set the bottom border color
                width: 1.0, // Set the border width
              ),
            ), // Add bottom border with primary color
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leadingImage != null) // Conditionally render the leading image
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    leadingImageColor ?? ColorRes.primaryColor, // Use the provided color or transparent
                    BlendMode.srcATop,
                  ),
                  child: Image.asset(
                    leadingImage!,
                    width: 24, // Adjust width as needed
                    height: 24, // Adjust height as needed
                  ),
                ),
              const SizedBox(width: 5), // Add some spacing between the icon and the title
              Expanded( // Wrap title with Expanded to avoid overflow
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: ColorRes.textColor,
                  ),
                ),
              ),
              Icon(
                icon,
                color: ColorRes.textColor,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
