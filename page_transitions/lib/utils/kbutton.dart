import 'package:flutter/material.dart';

const kButtonBorderRadius = 8.0;
const kWhite = Color(0xfff7f2fa);

class KButton extends StatelessWidget {
  final String text;
  final IconData? iconImage;
  final void Function()? onTap;
  const KButton({
    required this.text,
    required this.onTap,
    this.iconImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kButtonBorderRadius),
            color: Colors.black87,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: kWhite,
                ),
              ),
              if (iconImage != null) ...[
                Icon(
                  iconImage,
                  color: kWhite,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
