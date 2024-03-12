
class CategoriasModel {
  String? section;
  CategoriasModel({this.section});

  factory CategoriasModel.fromJson(Map<String, dynamic> json) => CategoriasModel(
        section: json['name'] as String?,
      );

  Map<String, dynamic> toJson() =>
      {'name' : section};
}
