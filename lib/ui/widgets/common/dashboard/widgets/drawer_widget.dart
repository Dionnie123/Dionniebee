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

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int? selectedItem;

  setItem(int index) {
    setState(() {
      selectedItem = index;
    });
  }

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
                selected: selectedItem == 0,
                title: "Tutorial",
                onTap: () async {
                  setItem(0);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 1,
                title: "About Use",
                onTap: () async {
                  setItem(1);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 2,
                title: "Feedback",
                onTap: () async {
                  setItem(2);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 3,
                title: "Contact Us",
                onTap: () async {
                  setItem(3);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 4,
                title: "Book a Virtual Party",
                onTap: () async {
                  setItem(4);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 5,
                title: "FAQs",
                onTap: () async {
                  setItem(5);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 6,
                title: "Terms & Conditions",
                onTap: () async {
                  setItem(6);
                  await navService.replaceWithHomeView();
                },
              ),
              DrawerMenu(
                selected: selectedItem == 7,
                title: "Privacy Policy",
                onTap: () async {
                  setItem(7);
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
