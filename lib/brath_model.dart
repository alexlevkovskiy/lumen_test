class BreathModel {
  late String date;
  late bool isValid;
  late List<double> flow;

  BreathModel({required this.date, required this.isValid, required this.flow});

  BreathModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    isValid = json['isValid'];
    flow = json['flow'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['isValid'] = this.isValid;
    data['flow'] = this.flow;
    return data;
  }
}
