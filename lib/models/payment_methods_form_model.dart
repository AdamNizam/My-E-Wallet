class PaymentMethodsFormModel {
  int? id;
  String? name;
  String? code;
  String? thumbnail;
  String? time;

  PaymentMethodsFormModel({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.time,
  });

  factory PaymentMethodsFormModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsFormModel(
        id: json['id'],
        name: json['name'],
        code: json['code'],
        thumbnail: json['thumbnail'],
        time: json['time'],
      );
}
