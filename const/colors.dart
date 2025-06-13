import 'package:flutter/material.dart';

// Primary Colors
const Color primaryBlue = Color(0xFF2196F3);
const Color primaryTurquoise = Color(0xFF00BCD4);
const Color accentPink = Color(0xFFFF4081);

// Text Colors
const Color textDark = Color(0xFF2C3E50);
const Color textLight = Color(0xFF7F8C8D);

// Background Colors
const Color backgroundLight = Color(0xFFF5F6FA);

// Gradients
const LinearGradient primaryGradient = LinearGradient(
  colors: [primaryBlue, primaryTurquoise],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const LinearGradient accentGradient = LinearGradient(
  colors: [Color(0xFFE91E63), Color(0xFFFF4081)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final LinearGradient backgroundGradient = LinearGradient(
  colors: [backgroundLight, backgroundLight.withOpacity(0.8)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

// Category Colors
final Map<String, Color> categoryColors = {
  'Work': const Color(0xFF2196F3),
  'Personal': const Color(0xFF00BCD4),
  'Shopping': const Color(0xFF03A9F4),
  'Health': const Color(0xFF0097A7),
  'All': const Color(0xFF2196F3),
};
