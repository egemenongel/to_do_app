import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  OverlayState get overlay => Overlay.of(this);
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);
  TextDirection get textDirection => Directionality.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusNode get focus => Focus.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  double get top => MediaQuery.viewPaddingOf(this).top;
  double get bottom => MediaQuery.viewPaddingOf(this).bottom;

  double get keyboardAwareBottom => MediaQuery.viewInsetsOf(this).bottom;

  bool get isKeyboardOpen => keyboardAwareBottom != 0.0;
  bool get isFullScreen => top == 0.0 && bottom == 0.0;
}

extension DirectionalityExtension on BuildContext {
  bool get isRtl => textDirection == TextDirection.rtl;
}

extension FocusExtension on BuildContext {
  void previousFocus() => focus.previousFocus();
  void nextFocus() => focus.nextFocus();
  void unfocus() => focus.unfocus();
}

extension PaddingExtension on BuildContext {
  EdgeInsets get padding4 => const EdgeInsets.all(4);
  EdgeInsets get padding8 => const EdgeInsets.all(8);
  EdgeInsets get padding12 => const EdgeInsets.all(12);
  EdgeInsets get padding16 => const EdgeInsets.all(12);

  EdgeInsets get paddingHorizontal4 =>
      const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsets get paddingHorizontal8 =>
      const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get paddingHorizontal12 =>
      const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get paddingHorizontal16 =>
      const EdgeInsets.symmetric(horizontal: 16);

  EdgeInsets get paddingVertical4 => const EdgeInsets.symmetric(vertical: 4);
  EdgeInsets get paddingVertical8 => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get paddingVertical12 => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get paddingVertical16 => const EdgeInsets.symmetric(vertical: 16);
}
