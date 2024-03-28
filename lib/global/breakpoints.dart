import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

setScreenBreakPoints() {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
      const ScreenBreakpoints(desktop: 1366, tablet: 768, watch: 200));
}

bool isMobile(BuildContext context) {
  var deviceType = getDeviceType(MediaQuery.of(context).size);
  return deviceType == DeviceScreenType.mobile;
}

bool isTablet(BuildContext context) {
  var deviceType = getDeviceType(MediaQuery.of(context).size);
  return deviceType == DeviceScreenType.tablet;
}

bool isDesktop(BuildContext context) {
  var deviceType = getDeviceType(MediaQuery.of(context).size);
  return deviceType == DeviceScreenType.desktop;
}

screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
