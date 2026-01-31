import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../core/router/router.gr.dart';
import '../../../main.dart';
import '../../../services/app/app_service.dart';
import '../../../services/gallery_photos/gallery_photo_service.dart';
import '../../../services/payments/models/placement_type.dart';
import '../../../services/payments/payment_service.dart';
import '../../../services/photo/photo_service.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required PhotoService photoService,
    required PaymentService paymentService,
    required GalleryPhotoService galleryService,
    required AppService appService,
  }) : _galleryService = galleryService,
       _paymentService = paymentService,
       _photoService = photoService,
       _appService = appService,
       super(SplashInitial());
  final PhotoService _photoService;
  final PaymentService _paymentService;
  final GalleryPhotoService _galleryService;
  final AppService _appService;

  Future<void> initializeServices() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      _appService.getApplicationOpenCount(),
      _appService.disableScreenshot(),
      _paymentService.init(),
    ]);
    _photoService.getPhotos();
    _galleryService.loadGalleryPhotos();
    routerSettings(
      _appService.applicationOpenCount,
      _paymentService.state.isPremium,
    );
  }

  void routerSettings(int openCount, bool isPremium) =>
      switch ((openCount, isPremium)) {
        (0, _) => appRouter.replaceAll([OnboardingRoute()]),
        (_, true) => appRouter.replaceAll([MainRoute()]),
        _ => appRouter.replaceAll([
          //TODO
          MainRoute(),
          PaywallRoute(placementType: PlacementType.start),
          // OnboardingRoute(),
        ]),
      };
}
