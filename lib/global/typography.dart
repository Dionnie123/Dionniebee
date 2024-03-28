import 'package:dionniebee/global/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

setGoogleFontLicense() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
}

final appFont = GoogleFonts.varelaRound().fontFamily;

class EzText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const EzText.headingOne(this.text, {super.key}) : style = heading1Style;
  const EzText.headingTwo(this.text, {super.key}) : style = heading2Style;
  const EzText.headingThree(this.text, {super.key}) : style = heading3Style;
  const EzText.headline(this.text, {super.key}) : style = headlineStyle;
  const EzText.subheading(this.text, {super.key}) : style = subheadingStyle;
  const EzText.caption(this.text, {super.key}) : style = captionStyle;

  EzText.body(this.text, {super.key, Color color = kcMediumGrey})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}

const TextStyle heading1Style = TextStyle(
  fontSize: 34,
  fontWeight: FontWeight.w400,
);

const TextStyle heading2Style = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w600,
);

const TextStyle heading3Style = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const TextStyle headlineStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const TextStyle bodyStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle subheadingStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle captionStyle = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w400,
);
