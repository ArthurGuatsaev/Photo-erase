// ignore_for_file: public_member_api_docs, sort_constructors_first
class Photo {
  final String id;
  final String photoPath;
  final DateTime date;
  Photo({required this.id, required this.photoPath, required this.date});

  Photo.create({this.id = '', required String path})
    : date = DateTime.now(),
      photoPath = path;

  Photo copyWith({String? id, String? photoPath, DateTime? date}) {
    return Photo(
      id: id ?? this.id,
      photoPath: photoPath ?? this.photoPath,
      date: date ?? this.date,
    );
  }
}
