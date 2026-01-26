class Review {
  final String name;
  final double rating;
  final String text;
  final String avatarPath;
  bool isVisible;
  Review({
    required this.name,
    required this.rating,
    required this.text,
    required this.avatarPath,
    required this.isVisible,
  });
}
