import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/app.router.dart';
import 'package:dionniebee/app/models/user_dto.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:dionniebee/services/fluttertoast/fluttertoast_service.dart';
import 'package:dionniebee/services/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final navigationService = locator<RouterService>();
  final cartService = locator<CartService>();
  final authService = locator<AuthService>();
  final userService = locator<UserService>();
  final toastService = locator<FlutterToastService>();
  List<ValueKey<int>> keys = [
    const ValueKey<int>(0),
    const ValueKey<int>(1),
    const ValueKey<int>(2),
    const ValueKey<int>(3)
  ];

  UserDto? get user => userService.currentUser;

  @override
  List<ListenableServiceMixin> get listenableServices => [userService];

  Future welcome() async {
    if (userService.hasLoggedInUser) {
      await Future.delayed(const Duration(seconds: 1));
      await toastService.show("Welcome ${(userService.currentUser?.email)}");
    } else {
      await Future.delayed(const Duration(seconds: 1));
      await toastService.show("Welcome Guest");
    }
  }

  signOut() async {
    await authService.signOut();
    toastService.clear();
    toastService.show("You logged out...");
    toastService.show("Welcome Guest");
    await navigationService.replaceWithDashboardView();
  }
}
