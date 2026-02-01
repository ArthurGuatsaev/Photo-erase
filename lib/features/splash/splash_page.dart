import 'package:auto_route/auto_route.dart';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/features/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:lottie_native/lottie_native.dart';

import '../widgets/wrapper/background.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void dispose() {
    if (getIt.isRegistered<SplashCubit>()) {
      getIt.unregister<SplashCubit>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<SplashCubit>()..initializeServices(),
      child: BackgroundWrapper(
        isSplash: true,
        child: Align(
          alignment: Alignment.center,
          child: Lottie.asset('assets/animations/opening.json'),
        ),
      ),
    );
  }
}
