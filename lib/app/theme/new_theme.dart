import 'package:flutter/material.dart';
import 'custom_color.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  CustomColor get greyColor => CustomColor.greyColor;

  CustomColor get darkColor => CustomColor.darkColor;

  CustomColor get whiteColor => CustomColor.appWhiteColor;

  Color get otherStroke => const Color(0xFFCED4DA);
}

// text theme extension

extension TextThemeExtension on TextTheme {
  ///LARGE TITLES           =>            //** FONTSİZE - 34 **//

  TextStyle get largeTitleRegular =>
      const TextStyle(color: Colors.black).newRegular.newSize(34);

  TextStyle get largeTitleEmphasized =>
      const TextStyle(color: Colors.black).emphasized.newSize(34);

  ///TITLE1's           =>           //** FONTSİZE - 28 **//

  TextStyle get title1Regular =>
      const TextStyle(color: Colors.black).newRegular.newSize(28);

  TextStyle get title1Emphasized =>
      const TextStyle(color: Colors.black).emphasized.newSize(28);

  ///TITLE2's           =>           //** FONTSİZE - 22 **//

  TextStyle get title2Regular =>
      const TextStyle(color: Colors.black).newRegular.newSize(22);

  TextStyle get title2Emphasized =>
      const TextStyle(color: Colors.black).emphasized.newSize(22);

  TextStyle get title2Medium =>
      const TextStyle(color: Colors.black).newMedium.newSize(22);

  ///TITLE3's           =>           //** FONTSİZE - 20 **//

  TextStyle get title3Regular =>
      const TextStyle(color: Colors.black).newRegular.newSize(20);

  TextStyle get title3Emphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(20);

  ///HEADLINES           =>           //** FONTSİZE - 17 **//

  TextStyle get headlineRegular =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(19);

  TextStyle get headlineItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(19);

  ///BODIES           =>           //** FONTSİZE - 17 **//

  TextStyle get bodyRegular =>
      const TextStyle(color: Colors.black).newRegular.newSize(17);

  TextStyle get bodyEmphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(17);

  TextStyle get bodyItalic =>
      const TextStyle(color: Colors.black).italic.newSize(17);

  TextStyle get bodyEmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(17);

  ///CALLOUTS           =>           //** FONTSİZE - 16 **//

  TextStyle get calloutRegular =>
      const TextStyle(color: Colors.black).newRegular.newSize(16);

  TextStyle get calloutEmphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(16);

  TextStyle get calloutItalic =>
      const TextStyle(color: Colors.black).italic.newSize(16);

  TextStyle get calloutEmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(16);

  ///SUBHEADLINES           =>           //** FONTSİZE - 15 **//

  TextStyle get subheadlineRegular =>
      const TextStyle(color: Colors.black).newRegular.newSize(15);

  TextStyle get subheadlineEmphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(15);

  TextStyle get subheadlineItalic =>
      const TextStyle(color: Colors.black).italic.newSize(15);

  TextStyle get subheadlineEmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(15);

  ///FOOTNOTES           =>           //** FONTSİZE - 13 **//

  TextStyle get footnoteRegular =>
      const TextStyle(color: Colors.black).newRegular.newSize(13);

  TextStyle get footnoteEmphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(13);

  TextStyle get footnoteItalic =>
      const TextStyle(color: Colors.black).italic.newSize(13);

  TextStyle get footnoteEmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(13);

  ///CAPTION1's           =>           //** FONTSİZE - 12 **//

  TextStyle get caption1Regular =>
      const TextStyle(color: Color(0xff4E4E4E)).newRegular.newSize(12);

  TextStyle get caption1Emphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(12);

  TextStyle get caption1Italic =>
      const TextStyle(color: Colors.black).italic.newSize(12);

  TextStyle get caption1EmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(12);

  ///CAPTION2's           =>           //** FONTSİZE - 11 **//

  TextStyle get caption2Regular =>
      const TextStyle(color: Colors.black).newRegular.newSize(11);

  TextStyle get caption2Emphasized =>
      const TextStyle(color: Colors.black).semiEmphasized.newSize(11);

  TextStyle get caption2Italic =>
      const TextStyle(color: Colors.black).italic.newSize(11);

  TextStyle get caption2EmphasizedItalic =>
      const TextStyle(color: Colors.black).semiEmphasized.italic.newSize(11);
}

extension TextStyleExtension on TextStyle {
  TextStyle get emphasized => copyWith(fontWeight: FontWeight.w700);

  TextStyle get semiEmphasized => copyWith(fontWeight: FontWeight.w600);

  TextStyle get newRegular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get newMedium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle newSize(double size) => copyWith(fontSize: size);
}
