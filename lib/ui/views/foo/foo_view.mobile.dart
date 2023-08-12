import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'foo_viewmodel.dart';

class FooViewMobile extends ViewModelWidget<FooViewModel> {
  const FooViewMobile({super.key});

  @override
  Widget build(BuildContext context, FooViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: "1",
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1541167760496-1628856ab772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1637&q=80',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'Hello, MOBILE UI!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
