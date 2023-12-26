import 'package:flutter/material.dart';
import 'package:fruitproject/core/constants.dart';
import 'package:fruitproject/features/splash/presentation/widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key); // Correction ici

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      body: SplashViewBody(),
    );
  }
}
