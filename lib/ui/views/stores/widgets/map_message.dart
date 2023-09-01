import 'package:app_settings/app_settings.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class MapMessage extends StatelessWidget {
  const MapMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Location is everything! Enable it on Settings",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            vSpaceSmall,
            const Text(
              "Hi there! To provide you with the best experience, we need to access your location. This will help us tailor our services to your area.",
              textAlign: TextAlign.center,
            ),
            vSpaceSmall,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                    onPressed: () {},
                    child: const Text("Return")),
                hSpaceSmall,
                ElevatedButton(
                    onPressed: () async {
                      if (await Permission.location.isPermanentlyDenied ||
                          await Permission.location.isDenied) {
                        await AppSettings.openAppSettings();
                      }
                    },
                    child: const Text("Settings"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
