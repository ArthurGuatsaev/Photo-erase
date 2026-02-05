import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:erasica/services/quick_actions/quick_actions_service.dart';
import 'package:injectable/injectable.dart';

import '../../../core/router/router.gr.dart';
import '../../../main.dart';
import '../../../services/app/app_service.dart';
import '../../../services/gallery_photos/gallery_photo_service.dart';
import '../../../services/payments/models/placement_type.dart';
import '../../../services/payments/payment_service.dart';
import '../../../services/photo/photo_service.dart';
import '../../../services/ui_message/ui_message_service.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit({
    required PhotoService photoService,
    required PaymentService paymentService,
    required GalleryPhotoService galleryService,
    required AppService appService,
    required UIMessageService messageService,
    required QuickActionsService quickActionsService,
  }) : _galleryService = galleryService,
       _paymentService = paymentService,
       _photoService = photoService,
       _appService = appService,
       _quickActionsService = quickActionsService,
       super(SplashInitial());
  final PhotoService _photoService;
  final PaymentService _paymentService;
  final GalleryPhotoService _galleryService;
  final AppService _appService;
  final QuickActionsService _quickActionsService;

  Future<void> initializeServices() async {
    await Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      _appService.init(),
      _paymentService.init(),
      _quickActionsService.init(),
    ]);
    _photoService.getPhotos();
    _galleryService.loadGalleryPhotos();
    routerSettings(
      _appService.applicationOpenCount,
      _paymentService.state.isPremium,
    );
  }

  void routerSettings(int openCount, bool isPremium) {
    switch ((openCount, isPremium)) {
      case (0, _):
        appRouter.replaceAll([const OnboardingRoute()]);
      case (_, true):
        appRouter.replaceAll([const MainRoute()]);
      default:
        appRouter.replaceAll([
          PaywallRoute(placementType: PlacementType.start),
        ]);
    }
  }
}
