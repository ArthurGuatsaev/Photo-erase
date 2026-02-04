// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'web_bg_cubit.dart';

class WebBgState {
  const WebBgState({
    this.defaultWebImages = const [],
    this.searchWebImages = const [],
    this.isLoading = false,
  });
  final List<WebBg> defaultWebImages;
  final List<WebBg> searchWebImages;
  final bool isLoading;

  WebBgState copyWith({
    List<WebBg>? defaultWebImages,
    List<WebBg>? searchWebImages,
    bool? isLoading,
  }) {
    return WebBgState(
      defaultWebImages: defaultWebImages ?? this.defaultWebImages,
      searchWebImages: searchWebImages ?? this.searchWebImages,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
