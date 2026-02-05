import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../../main/blocs/photo/photo_bloc.dart';
import '../../widgets/buttons/glass_icon_btn.dart';
import '../bloc/history_bloc.dart';

class HistoryBottomRow extends StatelessWidget {
  const HistoryBottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: context.appWidget.data.pagePadding,
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistoryInitial) {
                return const SizedBox();
              }
              if (state is HistorySelecting && state.selected.isEmpty) {
                return const _SelectedActionsBtn(onDelete: null, onShare: null);
              }

              final photos = context.read<PhotoBloc>().state.photos;
              return _SelectedActionsBtn(
                onDelete: () {
                  context.read<PhotoBloc>().add(
                    PressDeletePhotos(
                      photos: state.selected.toList(),
                      backCallback: () {
                        if (photos.length == state.selected.length) {
                          appRouter.popUntil(
                            (route) => route.settings.name == 'MainRoute',
                          );
                        } else {
                          appRouter.maybePop();
                        }
                      },
                    ),
                  );
                  context.read<HistoryBloc>().add(PressCancelSelect());
                },
                onShare: () {
                  final render = context.findRenderObject() as RenderBox;
                  context.read<PhotoBloc>().add(
                    PressSharePhotos(photos: photos, render: render),
                  );
                  context.read<HistoryBloc>().add(PressCancelSelect());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SelectedActionsBtn extends StatelessWidget {
  const _SelectedActionsBtn({this.onDelete, this.onShare});

  final VoidCallback? onDelete;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    final btnData = context.glassButtonData.data;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlassIconBtn(
          data: btnData,
          icon: CupertinoIcons.delete,
          color: const Color.fromRGBO(226, 17, 17, 1),
          onTap: onDelete,
        ),
        GlassIconBtn(data: btnData, icon: CupertinoIcons.share, onTap: onShare),
      ],
    );
  }
}
