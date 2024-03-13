
class ViewCategoriasModel {
  String? categoraisName;
  ViewCategoriasModel({this.categoraisName});

  factory ViewCategoriasModel.fromJson(Map<String, dynamic> json) => ViewCategoriasModel(
        categoraisName: json['name'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'name' : categoraisName};
}
