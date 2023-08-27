import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.signInAnonymously();
      Future.delayed(const Duration(milliseconds: 200), () {
        FlutterNativeSplash.remove();
      });
    });

    super.onViewModelReady(viewModel);
  }
}
