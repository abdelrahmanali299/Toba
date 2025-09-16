class AyahModel {
  final String text;

  AyahModel({required this.text});

  factory AyahModel.fromJson(
      {required Map<String, dynamic> json, required int index}) {
    return AyahModel(text: json["verse"]['verse_${index + 1}']);
  }
}
