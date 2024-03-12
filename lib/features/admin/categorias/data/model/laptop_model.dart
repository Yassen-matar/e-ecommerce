class LaptopModel {
  int? price;
  String? title;
  String? desreption;
  LaptopModel({this.price, this.title, this.desreption});

  factory LaptopModel.fromJson(Map<String, dynamic> json) => LaptopModel(
        price: json ['Specifications']['price'] as int?,
        title: json['Specifications']['title'] as String?,
        desreption: json['Specifications']['desreption'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'price': price, 'title': title, 'descreption': desreption};
}

