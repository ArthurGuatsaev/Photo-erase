import 'package:erasica/features/widgets/loading/loading_adaptive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bg_cubit/bg_cubit.dart';

class BgLoading extends StatelessWidget {
  const BgLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BgCubit, BgState>(
      builder: (context, state) {
        if (state.loading) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
            ),
            child: const AdaptiveLoading(),
          );
        }
        return const SizedBox();
      },
    );
  }
}
