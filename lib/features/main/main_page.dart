import 'package:auto_route/auto_route.dart';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/core/router/router.gr.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/buttons/leading_button.dart';
import '../widgets/wrapper/background.dart';
import 'blocs/app/app_cubit.dart';
import 'blocs/photo/photo_bloc.dart';
import 'widgets/app_name_box.dart';
import 'widgets/gallery_photos/gallery_photo_box.dart';
import 'widgets/main_history_box.dart';
import 'widgets/main_loading_box.dart';
import 'widgets/erase_button_box.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final photoBloc = getIt<PhotoBloc>();
  final appCubit = getIt<AppCubit>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => photoBloc),
        BlocProvider(lazy: false, create: (context) => appCubit),
      ],
      child: BackgroundWrapper(
        isMainPage: true,
        loading: const MainLoadingBox(),
        child: Scaffold(
          appBar: AppBar(
            leading: LeadingBtn(
              icon: CupertinoIcons.gear,
              onTap: () => appRouter.push(SettingsRoute()),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              AppNameBox(),
              SliverToBoxAdapter(child: EraseButtonsBox(photoBloc: photoBloc)),
              GalleryPhotoBox(),
              SliverPadding(padding: EdgeInsets.only(top: 16)),
              MainHistoryBox(),
              SliverPadding(padding: EdgeInsets.only(top: 38)),
            ],
          ),
        ),
      ),
    );
  }
}
