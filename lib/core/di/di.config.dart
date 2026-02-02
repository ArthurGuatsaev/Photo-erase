// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i497;

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sqflite/sqflite.dart' as _i779;

import '../../data/local_repository.dart' as _i859;
import '../../data/photo/local/local_datasource_impl.dart' as _i366;
import '../../data/photo/local/photo_model.dart' as _i479;
import '../../data/photo/photo_repository.dart' as _i289;
import '../../data/repository.dart' as _i844;
import '../../entities/photo/photo.dart' as _i790;
import '../../features/erasing/blocs/canvas/canvas_bloc.dart' as _i473;
import '../../features/erasing/blocs/erase/erase_bloc.dart' as _i270;
import '../../features/main/bloc/photo_bloc.dart' as _i209;
import '../../features/main/widgets/gallery_photos/gallery_cubit.dart' as _i208;
import '../../features/onboarding/onboarding_cubit.dart' as _i1062;
import '../../features/paywall/cubits/paying/paying_cubit.dart' as _i109;
import '../../features/paywall/cubits/paywall/paywall_cubit.dart' as _i452;
import '../../features/paywall/paywall_types/paywall_type_tunnel/widgets/steps/tunnel_cubit/paywall_type_tunnel_cubit.dart'
    as _i283;
import '../../features/settings/settings_cubit.dart' as _i979;
import '../../features/splash/cubit/splash_cubit.dart' as _i782;
import '../../services/app/app_service.dart' as _i876;
import '../../services/app/app_service_impl.dart' as _i446;
import '../../services/erase/erase_service.dart' as _i836;
import '../../services/erase/erase_service_impl.dart' as _i226;
import '../../services/gallery_photos/gallery_photo_service.dart' as _i638;
import '../../services/gallery_photos/gallery_photos_service_impl.dart'
    as _i440;
import '../../services/payments/models/placement_type.dart' as _i320;
import '../../services/payments/payment_service.dart' as _i1029;
import '../../services/payments/payment_service_impl.dart' as _i712;
import '../../services/photo/photo_service.dart' as _i344;
import '../../services/photo/photo_service_impl.dart' as _i1048;
import '../../services/quick_actions/quick_actions_service.dart' as _i97;
import '../../services/ui_message/ui_message_service.dart' as _i287;
import '../../services/ui_message/ui_message_service_impl.dart' as _i555;
import '../app_database.dart' as _i951;
import '../observers/bloc_observer.dart' as _i394;
import 'di.dart' as _i913;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i473.CanvasBloc>(() => _i473.CanvasBloc());
  gh.singleton<_i394.ErrorBlocObserver>(() => _i394.ErrorBlocObserver());
  gh.lazySingleton<_i951.AppDatabase>(() => _i951.AppDatabase());
  gh.lazySingleton<_i876.AppService>(() => _i446.AppServiceImpl());
  gh.lazySingleton<_i1029.PaymentService>(
    () => _i712.PaymentServiceImpl(appService: gh<_i876.AppService>()),
  );
  gh.factoryParam<_i452.PaywallCubit, _i320.PlacementType, _i790.Photo?>(
    (placementType, photo) => _i452.PaywallCubit(
      placementType: placementType,
      photo: photo,
      paymantServie: gh<_i1029.PaymentService>(),
    ),
  );
  gh.lazySingleton<_i287.UIMessageService>(() => _i555.UIMessageServiceImpl());
  gh.lazySingleton<_i836.EraseService>(() => _i226.EraseServiceImpl());
  await gh.factoryAsync<_i497.Directory>(
    () => appModule.provideDirectory(gh<_i876.AppService>()),
    preResolve: true,
  );
  gh.factory<String>(() => appModule.photosTable, instanceName: 'photosTable');
  gh.factory<_i979.SettingsCubit>(
    () => _i979.SettingsCubit(
      gh<_i876.AppService>(),
      gh<_i1029.PaymentService>(),
      gh<_i287.UIMessageService>(),
    ),
  );
  gh.lazySingleton<_i97.QuickActionsService>(
    () => _i97.QuickActionsServiceImpl(gh<_i1029.PaymentService>()),
  );
  gh.lazySingleton<_i638.GalleryPhotoService>(
    () => _i440.GalleryPhotosServiceImpl(directory: gh<_i497.Directory>()),
  );
  await gh.factoryAsync<_i779.Database>(
    () => appModule.provideDatabase(gh<_i951.AppDatabase>()),
    preResolve: true,
  );
  gh.lazySingleton<_i1062.OnboardingCubit>(
    () => _i1062.OnboardingCubit(
      gh<_i876.AppService>(),
      gh<_i1029.PaymentService>(),
    ),
  );
  gh.factoryParam<_i283.PaywallTypeTunnelCubit, bool, dynamic>(
    (onlyTimeline, _) => _i283.PaywallTypeTunnelCubit(
      gh<_i287.UIMessageService>(),
      onlyTimeline: onlyTimeline,
    ),
  );
  gh.factory<_i109.PayingCubit>(
    () => _i109.PayingCubit(
      gh<_i1029.PaymentService>(),
      gh<_i287.UIMessageService>(),
      gh<_i876.AppService>(),
    ),
  );
  gh.lazySingleton<_i859.LocalDataSource<_i479.PhotoModel>>(
    () => _i366.PhotoLocalDatasourceImpl(
      db: gh<_i779.Database>(),
      table: gh<String>(instanceName: 'photosTable'),
    ),
  );
  gh.lazySingleton<_i844.Repository<_i790.Photo>>(
    () => _i289.PhotoRepositoryImpl(
      local: gh<_i859.LocalDataSource<_i479.PhotoModel>>(),
    ),
  );
  gh.lazySingleton<_i344.PhotoService>(
    () => _i1048.PhotoServiceImpl(
      repository: gh<_i844.Repository<_i790.Photo>>(),
      appService: gh<_i876.AppService>(),
    ),
  );
  gh.factory<_i782.SplashCubit>(
    () => _i782.SplashCubit(
      photoService: gh<_i344.PhotoService>(),
      paymentService: gh<_i1029.PaymentService>(),
      galleryService: gh<_i638.GalleryPhotoService>(),
      appService: gh<_i876.AppService>(),
    ),
  );
  gh.factory<_i209.PhotoBloc>(
    () => _i209.PhotoBloc(
      photoService: gh<_i344.PhotoService>(),
      uiMessageService: gh<_i287.UIMessageService>(),
      eraseService: gh<_i836.EraseService>(),
      paymentService: gh<_i1029.PaymentService>(),
    ),
  );
  gh.factoryParam<_i270.EraseBloc, _i790.Photo, dynamic>(
    (initialPhoto, _) => _i270.EraseBloc(
      eraseService: gh<_i836.EraseService>(),
      photoService: gh<_i344.PhotoService>(),
      uiMessageService: gh<_i287.UIMessageService>(),
      initialPhoto: initialPhoto,
    ),
  );
  gh.lazySingleton<_i208.GalleryCubit>(
    () => _i208.GalleryCubit(
      galleryService: gh<_i638.GalleryPhotoService>(),
      uiMessageService: gh<_i287.UIMessageService>(),
      photoService: gh<_i344.PhotoService>(),
      appService: gh<_i876.AppService>(),
    ),
  );
  return getIt;
}

class _$AppModule extends _i913.AppModule {}
