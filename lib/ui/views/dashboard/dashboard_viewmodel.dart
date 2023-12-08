import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/services/auth_service.dart';
import 'package:dionniebee/services/cart_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends IndexTrackingViewModel {
  final navigationService = locator<RouterService>();
  final cartService = locator<CartService>();
  final authService = locator<AuthService>();
}
