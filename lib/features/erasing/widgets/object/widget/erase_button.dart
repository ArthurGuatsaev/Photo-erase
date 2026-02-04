import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/main_button.dart';
import '../../../blocs/erase/erase_bloc.dart';
import '../mask_cubit/mask_cubit.dart';

class MaskEraseButton extends StatelessWidget {
  const MaskEraseButton({
    super.key,
    required this.maskCubit,
    required this.eraseBloc,
  });

  final MaskCubit maskCubit;
  final EraseBloc eraseBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaskCubit, MaskState>(
      builder: (context, state) {
        return MainButton(
          icon: CupertinoIcons.tags,
          title: 'Erase',
          onTap: state.strokes.isEmpty
              ? null
              : () async {
                  final bytes = await maskCubit.saveMask();
                  if (bytes == null) return;
                  eraseBloc.add(PressEraseObj(mask: bytes));
                },
        );
      },
    );
  }
}
