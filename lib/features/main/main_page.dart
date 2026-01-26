import 'package:auto_route/auto_route.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/di/di.dart';
import 'package:erasica/core/router/router.gr.dart';
import 'package:erasica/features/main/widgets/gallery_photos/gallery_cubit.dart';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/buttons/leading_button.dart';
import '../widgets/wrapper/background.dart';
import 'bloc/main_bloc.dart';
import 'widgets/app_name_box.dart';
import 'widgets/gallery_photos/gallery_photo_box.dart';
import 'widgets/main_history_box.dart';
import 'widgets/main_loading.dart';
import 'widgets/removing_button_box.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainBloc>(),
      child: BackgroundWrapper(
        isMainPage: true,
        loading: MainLoading(),
        child: Scaffold(
          appBar: AppBar(
            leading: LeadingBtn(
              icon: AssetsPath.iconSettings,
              onTap: () => appRouter.push(SettingsRoute()),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              AppNameBox(),
              SliverToBoxAdapter(child: RemovingButtonsBox()),
              BlocProvider(
                create: (context) => getIt<GalleryCubit>(),
                child: GalleryPhotoBox(),
              ),
              SliverPadding(padding: EdgeInsets.only(top: 18.h)),
              MainHistoryBox(),
              SliverPadding(padding: EdgeInsets.only(top: 38.h)),
            ],
          ),
        ),
      ),
    );
  }
}
