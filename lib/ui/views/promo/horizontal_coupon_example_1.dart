import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:dionniebee/ui/common/colors.dart';
import 'package:flutter/material.dart';

class HorizontalCouponExample1 extends StatelessWidget {
  const HorizontalCouponExample1({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = kcPrimaryColorLight;
    const Color secondaryColor = kcPrimaryColorDark;

    return CouponCard(
      height: 150,
      // backgroundColor: primaryColor,
      decoration: const BoxDecoration(
        color: primaryColor,
/*         image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://1.bp.blogspot.com/-d0Ysw1WgKWE/XLJFeEEgD7I/AAAAAAAAFSc/zuQgW3wuPs8MFh2TBqa6ndeHGjBn-G12wCKgBGAs/w0/v-bts-boy-with-luv-uhdpaper.com-4K-107.jpg")), */
      ),
      curveAxis: Axis.vertical,
      firstChild: Container(
        decoration: const BoxDecoration(
          color: secondaryColor,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '23%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'OFF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: Colors.white54, height: 0),
            Expanded(
              child: Center(
                child: Text(
                  'WINTER IS\nHERE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      secondChild: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(18),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coupon Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'FREESALES',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              'Valid Till - 30 Jan 2022',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
