class OneZkrModel {
  final String text;
  final int count;

  OneZkrModel({required this.text, required this.count});

  factory OneZkrModel.fromJson({required json}) {
    return OneZkrModel(text: json['text'], count: json['count']);
  }
}
