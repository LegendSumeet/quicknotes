import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Lottie.asset(
            repeat: true,
            backgroundLoading: true,
            reverse: true,
            "assets/json/loading.json",
            key: Key('${Random().nextInt(999999999)}'),
            width: 600,
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
