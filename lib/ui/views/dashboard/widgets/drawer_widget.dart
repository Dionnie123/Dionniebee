import 'package:dionniebee/ui/common/colors.dart';
import 'package:dionniebee/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
        tileColor: selected ? kcPrimaryColor : null,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.pop(context);
          Future.delayed(const Duration(milliseconds: 200));
          onTap();
        },
        title: Text(title,
            style: TextStyle(
                fontSize: 14, color: selected ? Colors.white : Colors.white)),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<DashboardViewModel>(context);
    int currentIndex = viewModel.currentIndex;

    return Drawer(
      backgroundColor: kcPrimaryColorDark,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.account_circle_rounded,
                  size: 30,
                  color: Colors.white,
                ),
                trailing: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Login/Register",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    )),
              ),
              Column(children: [
                DrawerMenu(
                  selected: currentIndex == 0,
                  title: "Tutorial",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 1,
                  title: "About Use",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 2,
                  title: "Feedback",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 3,
                  title: "Contact Us",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 4,
                  title: "Book a Virtual Party",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 5,
                  title: "FAQs",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 6,
                  title: "Terms & Conditions",
                  onTap: () async {},
                ),
                DrawerMenu(
                  selected: currentIndex == 7,
                  title: "Privacy Policy",
                  onTap: () async {},
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
