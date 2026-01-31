// ignore_for_file: public_member_api_docs, sort_constructors_first

class Photo {
  final String id;
  final String photoPath;
  final String initialPath;
  final DateTime date;
  Photo({
    required this.id,
    required this.photoPath,
    required this.date,
    required this.initialPath,
  });

  Photo.create({required String path})
    : date = DateTime.now(),
      photoPath = path,
      id = '',
      initialPath = path;

  Photo copyWith({
    String? id,
    String? photoPath,
    String? initialPath,
    DateTime? date,
  }) {
    return Photo(
      id: id ?? this.id,
      photoPath: photoPath ?? this.photoPath,
      initialPath: initialPath ?? this.initialPath,
      date: date ?? this.date,
    );
  }
}
