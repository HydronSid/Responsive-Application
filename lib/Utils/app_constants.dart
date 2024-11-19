import 'package:flutter/material.dart';

double getResponsiveTextSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth > 1200) {
    // For large screens like web
    return baseSize * 1.5;
  } else if (screenWidth > 600) {
    // For medium screens like tablets
    return baseSize * 1.2;
  } else {
    // For small screens like phones
    return baseSize;
  }
}
