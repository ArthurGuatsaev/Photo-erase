import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/loading/loading_universal.dart';
import '../cubits/paying/paying_cubit.dart';

class PayLoading extends StatelessWidget {
  const PayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayingCubit, PayingState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingUniversal();
        }
        return const SizedBox();
      },
    );
  }
}
