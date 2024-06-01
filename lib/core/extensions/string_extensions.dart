import 'package:flutter/material.dart';

extension Hardcoded on String {
  String get hardcoded => this;
}

extension ConvertExtension on String {
  String get capitalize => split(' ').map((e) => e.capitalizeFirst).join(' ');

  String get capitalizeFirst {
    if (this == '') return this;
    return this[0].toUpperCase() + characters.getRange(1).string.toLowerCase();
  }

  String get snakeCase {
    return replaceAllMapped(
            RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}')
        .replaceAll(RegExp(r'[\s-]+'),
            '_') // Replace spaces and dashes with underscores
        .replaceAll(RegExp(r'_{2,}'),
            '_') // Replace multiple underscores with a single underscore
        .replaceAll(
            RegExp(r'(^_|_$)'), ''); // Remove leading or trailing underscores
  }
}
