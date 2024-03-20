import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'validation_example_viewmodel.dart';

class ValidationExampleView extends StackedView<ValidationExampleViewModel> {
  const ValidationExampleView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ValidationExampleViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ValidationExampleViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ValidationExampleViewModel();
}
