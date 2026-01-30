class PhotoModel {
  final String id;
  final String photoPath;
  final DateTime date;
  PhotoModel({required this.id, required this.photoPath, required this.date});

  PhotoModel copyWith({String? id, String? photoPath, DateTime? date}) {
    return PhotoModel(
      id: id ?? this.id,
      photoPath: photoPath ?? this.photoPath,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id.isEmpty ? null : int.tryParse(id),
      'photo_path': photoPath,
      'created_at': date.millisecondsSinceEpoch,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'].toString(),
      photoPath: map['photo_path'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }
}
