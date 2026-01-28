import 'package:erasica/features/widgets/pop_up_content/sheet_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/wrapper/loading.dart';
import '../cubits/paying/paying_cubit.dart';

class PayLoading extends StatelessWidget {
  const PayLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PayingCubit, PayingState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          return LoadingWrapper(
            content: SheetLoading(
              title: 'loading_universal_title',
              subtitle: 'loading_universal_subtitle',
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
