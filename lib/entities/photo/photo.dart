class Photo {
  final String id;
  final String photoPath;
  final DateTime date;
  Photo({required this.id, required this.photoPath, required this.date});

  Photo.create({this.id = '', required String path})
    : date = DateTime.now(),
      photoPath = path.substring(path.lastIndexOf('/'));
}
