import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CategoriasRomteDataSource {
  Future<void> addCategorais(name);
}

class CategoriasRomteDataSourceImp extends CategoriasRomteDataSource {
  @override
  Future<void> addCategorais(name) {
    CollectionReference categorias =
        FirebaseFirestore.instance.collection('categorias');
    return categorias.add({'name': name});
  }
}
