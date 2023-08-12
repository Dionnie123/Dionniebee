import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleDivider extends StatelessWidget {
  final String title;
  const TitleDivider(this.title, {super.key, required});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18).copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.nunito().fontFamily,
              ),
            ),
            hSpaceSmall,
            const Expanded(
                child: Divider(
              height: 1,
              thickness: 1,
            ))
          ],
        ),
      ),
    );
  }
}
