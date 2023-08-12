import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'foo_viewmodel.dart';

class FooViewTablet extends ViewModelWidget<FooViewModel> {
  const FooViewTablet({super.key});

  @override
  Widget build(BuildContext context, FooViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
