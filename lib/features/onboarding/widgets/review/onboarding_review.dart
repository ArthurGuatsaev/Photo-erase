import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/const/assets_path.dart';
import '../../../../core/theme/app_theme.dart';
import '../../model/onboarding_step.dart';
import '../../model/review.dart';
import 'onboarding_review_item.dart';
import 'onboarding_review_rating.dart';

class OnboardingReview extends StatefulWidget {
  const OnboardingReview({super.key});

  @override
  State<OnboardingReview> createState() => _OnboardingReviewState();
}

class _OnboardingReviewState extends State<OnboardingReview> {
  @override
  void initState() {
    super.initState();
    reviews = [...OnboardingStep.step3Review.reviews];
    _animateCards();
  }

  static const double _baseTopFactor = 0.05;

  static const double _review1Scale = 0.9;
  static const double _review2Scale = 0.82;
  static const double _ratingHeight = 60;

  static const double _cardSpacing = 10;

  static const double _itemMaxWidth = 400;

  static const double _signedDocsBottomPadding = 16;

  final GlobalKey _review0Key = GlobalKey();
  final GlobalKey _review1Key = GlobalKey();
  final GlobalKey _review2Key = GlobalKey();
  final GlobalKey _signedDocsKey = GlobalKey();

  bool isSignedDocs = false;

  double _review0Height = 0;
  double _review1Height = 0;
  double _review2Height = 0;

  double _signedDocsHeight = 0;

  bool get _hasReviewMeasurements =>
      _review0Height > 0 && _review1Height > 0 && _review2Height > 0;

  bool get _hasAllMeasurements =>
      _hasReviewMeasurements && _signedDocsHeight > 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleMeasureCards();
  }

  void _animateCards() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      reviews[1].isVisible = true;
      setState(() {});
      _scheduleMeasureCards();
    });

    Future.delayed(const Duration(milliseconds: 550), () {
      if (!mounted) return;
      reviews[2].isVisible = true;
      setState(() {});
      _scheduleMeasureCards();
    });

    Future.delayed(const Duration(milliseconds: 1100), () {
      if (!mounted) return;
      isSignedDocs = true;
      setState(() {});
    });
  }

  void _scheduleMeasureCards() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _measureCardsIfNeeded();
    });
  }

  void _measureCardsIfNeeded() {
    final newReview0Height = _readHeight(_review0Key);
    final newReview1Height = _readHeight(_review1Key);
    final newReview2Height = _readHeight(_review2Key);
    final newSignedDocsHeight = _readHeight(_signedDocsKey);

    if (newReview0Height == null ||
        newReview1Height == null ||
        newReview2Height == null ||
        newSignedDocsHeight == null) {
      return;
    }

    final hasChanged =
        (newReview0Height - _review0Height).abs() > 0.5 ||
        (newReview1Height - _review1Height).abs() > 0.5 ||
        (newReview2Height - _review2Height).abs() > 0.5 ||
        (newSignedDocsHeight - _signedDocsHeight).abs() > 0.5;

    if (!hasChanged) return;

    setState(() {
      _review0Height = newReview0Height;
      _review1Height = newReview1Height;
      _review2Height = newReview2Height;
      _signedDocsHeight = newSignedDocsHeight;
    });
  }

  double? _readHeight(GlobalKey key) {
    final context = key.currentContext;
    if (context == null) return null;

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox) return null;

    if (!renderObject.hasSize) return null;
    return renderObject.size.height;
  }

  double _baseTop(double maxHeight) => maxHeight * _baseTopFactor;

  double _reviewsStartTop(double maxHeight) {
    final baseTop = _baseTop(maxHeight) + _ratingHeight;

    if (!_hasAllMeasurements) return baseTop;

    final signedDocsTop =
        maxHeight - _signedDocsBottomPadding - _signedDocsHeight;
    final availableHeight = signedDocsTop - baseTop;
    if (availableHeight <= 0) return baseTop;

    // Центрируем группу отзывов между верхом и нижним виджетом, учитывая scale карточек.
    final totalReviewsHeight =
        _review0Height +
        _cardSpacing +
        (_review1Height * _review1Scale) +
        _cardSpacing +
        (_review2Height * _review2Scale);

    final freeSpace = availableHeight - totalReviewsHeight;
    if (freeSpace <= 0) return baseTop;

    return baseTop + freeSpace / 2;
  }

  double _review1Top(double maxHeight) {
    if (!_hasReviewMeasurements) {
      final startTop = _reviewsStartTop(maxHeight);
      return startTop;
    }

    final startTop = _reviewsStartTop(maxHeight);
    if (!reviews[1].isVisible) return startTop;

    return startTop + _review0Height + _cardSpacing;
  }

  double _review2Top(double maxHeight) {
    if (!_hasReviewMeasurements) {
      final startTop = _reviewsStartTop(maxHeight);
      return startTop;
    }
    final startTop = _reviewsStartTop(maxHeight);
    if (!reviews[2].isVisible) return startTop;

    final review1Top = _review1Top(maxHeight);
    final review1VisualHeight = _review1Height * _review1Scale;

    return review1Top + review1VisualHeight + _cardSpacing;
  }

  late final List<Review> reviews;
  @override
  Widget build(BuildContext context) {
    final styleData = context.appWidget.data;
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;

        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AssetsPath.reviewBgRects,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: isSignedDocs ? 1 : 0,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 700),
                child: Center(
                  child: KeyedSubtree(
                    key: _signedDocsKey,
                    child: OnboardingRatingBox(styleData: styleData),
                  ),
                ),
              ),
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _review2Top(maxHeight),
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: _review2Scale,
                child: OnboardingReviewItem(
                  key: _review2Key,
                  review: reviews[2],
                  maxWidth: _itemMaxWidth,
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              top: _review1Top(maxHeight),
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: _review1Scale,
                child: OnboardingReviewItem(
                  key: _review1Key,
                  review: reviews[1],
                  maxWidth: _itemMaxWidth,
                ),
              ),
            ),
            Positioned(
              top: _reviewsStartTop(maxHeight),
              left: 0,
              right: 0,
              child: OnboardingReviewItem(
                key: _review0Key,
                review: reviews[0],
                maxWidth: _itemMaxWidth,
              ),
            ),
          ],
        );
      },
    );
  }
}
