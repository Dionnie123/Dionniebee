import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/ui/common/my_texts.dart';
import 'package:dionniebee/ui/common/ui_helpers.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  CircularProgressIndicator(),
            vSpaceRegular,
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "logo-red.png",
                    width: 70,
                  ),
                  vSpaceSmall,
                  const MyText.headingThree(
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
