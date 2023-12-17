import 'package:dionniebee/app/app.locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      locator<StartupViewModel>();

  @override
  Future<void> onViewModelReady(StartupViewModel viewModel) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.runStartUpLogic();
    });
    super.onViewModelReady(viewModel);
  }
}
