import 'package:flutter/material.dart';

import '../brand_colors.dart';

class TaxiButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const TaxiButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = BrandColors.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: color,
      textColor: Colors.white,
      child: SizedBox(
        height: 50,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
          ),
        ),
      ),
    );
  }
}
