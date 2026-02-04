import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/buttons/leading_button.dart';
import '../bloc/history_bloc.dart';

class HistoryLeading extends StatelessWidget {
  const HistoryLeading({super.key});

  @override
  Widget build(BuildContext context) {
    final historyBloc = context.read<HistoryBloc>();
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return LeadingBtn(
            icon: CupertinoIcons.chevron_back,
            onTap: appRouter.maybePop,
          );
        }
        return LeadingBtn(
          icon: CupertinoIcons.clear,
          onTap: () => historyBloc.add(PressCancelSelect()),
        );
      },
    );
  }
}
