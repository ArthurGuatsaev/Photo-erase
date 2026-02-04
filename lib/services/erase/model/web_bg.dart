class WebBg {
  final int id;
  final String smallUrl;
  final String largeUrl;

  WebBg({required this.id, required this.smallUrl, required this.largeUrl});

  factory WebBg.fromMap(Map<String, dynamic> map) {
    return WebBg(
      id: map['id'] as int,
      smallUrl: map['previewURL'] as String,
      largeUrl: map['largeImageURL'] as String,
    );
  }

  static List<WebBg> createList(List list) {
    final result = <WebBg>[];
    for (var i in list) {
      try {
        final bg = WebBg.fromMap(i);
        result.add(bg);
      } catch (e) {
        continue;
      }
    }
    return result;
  }
}
