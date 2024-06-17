import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class NoInternet extends ConsumerStatefulWidget {
  const NoInternet({super.key});

  @override
  ConsumerState<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends ConsumerState<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            repeat: true,
            backgroundLoading: true ,
            reverse: true,
            "assets/json/wifi.json",
            key: Key('${Random().nextInt(999999999)}'),
            width: 600,
            alignment: Alignment.topCenter,
          ),
          Text("No Internet Connection",
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
