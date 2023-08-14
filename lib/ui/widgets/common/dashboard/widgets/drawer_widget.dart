import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class DrawerMenu extends StatelessWidget {
  final bool selected;
  final String title;
  final Function() onTap;
  const DrawerMenu(
      {super.key,
      required this.title,
      required this.onTap,
      this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: selected ? Colors.red : null,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pop(context);
          Future.delayed(const Duration(milliseconds: 200));
          onTap();
        },
        title: Text(title,
            style: TextStyle(
                fontSize: 14, color: selected ? Colors.white : Colors.black)),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  final int? selectedIndex;
  const DrawerWidget({super.key, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final navService = locator<RouterService>();

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle_rounded,
                  size: 30, color: Theme.of(context).primaryColor),
              trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Login/Register",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  )),
            ),
            Column(children: [
              DrawerMenu(
                selected: selectedIndex == 0,
                title: "Tutorial",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 1,
                title: "About Use",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 2,
                title: "Feedback",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 3,
                title: "Contact Us",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 4,
                title: "Book a Virtual Party",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 5,
                title: "FAQs",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 6,
                title: "Terms & Conditions",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedIndex == 7,
                title: "Privacy Policy",
                onTap: () async {
                  await navService.replaceWithHomeView();
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
