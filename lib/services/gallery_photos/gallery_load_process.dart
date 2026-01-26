class GalleryLoadProcess {
  final List<String> photos;
  final GalleryLoadStatus status;
  GalleryLoadProcess({this.photos = const [], required this.status});
}

enum GalleryLoadStatus {
  loading,
  loaded,
  needToSettings,
  noAccess;

  bool get isNeedSetting => this == needToSettings;
}
