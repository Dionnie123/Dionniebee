import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/common/text_styles.dart';
import 'package:flutter/material.dart';

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
