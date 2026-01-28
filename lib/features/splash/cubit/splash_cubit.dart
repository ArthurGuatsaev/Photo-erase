import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erasica/core/router/router.gr.dart';
import 'package:erasica/main.dart';
import 'package:erasica/services/app/app_service.dart';
import 'package:erasica/services/gallery_photos/gallery_photo_service.dart';
import 'package:erasica/services/payments/models/placement_type.dart';
import 'package:erasica/services/payments/payment_service.dart';
import 'package:erasica/services/photo/photo_service.dart';
import 'package:injectable/injectable.dart';

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
    await _appService.getApplicationOpenCount();
    await _paymentService.init();
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
          // MainRoute(),
          // PaywallRoute(placementType: PlacementType.start),
          MainRoute(),
        ]),
      };
}
