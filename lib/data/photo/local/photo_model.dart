// ignore_for_file: public_member_api_docs, sort_constructors_first
class PhotoModel {
  final String id;
  final String photoPath;
  final String initialPath;
  final DateTime date;
  PhotoModel({
    required this.id,
    required this.photoPath,
    required this.date,
    required this.initialPath,
  });

  PhotoModel copyWith({
    String? id,
    String? photoPath,
    String? initialPath,
    DateTime? date,
  }) {
    return PhotoModel(
      id: id ?? this.id,
      photoPath: photoPath ?? this.photoPath,
      initialPath: initialPath ?? this.initialPath,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'photo_path': photoPath,
      'initial_path': initialPath,
      'created_at': date.millisecondsSinceEpoch,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'] as String,
      photoPath: map['photo_path'] as String,
      initialPath: map['initial_path'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }
}
