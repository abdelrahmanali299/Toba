class AzkarModel {
  final List<dynamic> azkar;

  AzkarModel({required this.azkar});

  factory AzkarModel.fromJson({required json, required int index}) {
    return AzkarModel(azkar: json[index]['array']);
  }
}
