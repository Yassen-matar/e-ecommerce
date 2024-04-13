import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:untitled/globals.dart' as global;

abstract class CategoriasRomteDataSource {
  Future<void> addCategorais(String name);
  Future<void> uploadFile(File path, String imagePath);
}

class CategoriasRomteDataSourceImp extends CategoriasRomteDataSource {
  @override
  Future<void> addCategorais(name) {
    CollectionReference categorias =
        FirebaseFirestore.instance.collection('categorias');

    return categorias.add({'name': name, 'url': global.url ?? ""});
  }

  @override
  Future<void> uploadFile(File path, String imagePath) async {
    String imageName = basename(imagePath);
    final storageRef =
        FirebaseStorage.instance.ref("ImagesCategorais").child(imageName);
    await storageRef.putFile(path);
    global.url = await storageRef.getDownloadURL();
  }
}
