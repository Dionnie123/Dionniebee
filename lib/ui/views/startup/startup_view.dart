import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/global/spacing.dart';
import 'package:dionniebee/global/typography.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo-red.png",
                    width: 70,
                  ),
                  vSpaceSmall,
                  const EzText.headingThree(
                    "Dionnie Studios",
                  ),
                ],
              ),
            ),
          ],
        ),
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
