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
      'id': id.isEmpty ? null : id,
      'photoPath': photoPath,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory PhotoModel.fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'] as String,
      photoPath: map['photoPath'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }
}
