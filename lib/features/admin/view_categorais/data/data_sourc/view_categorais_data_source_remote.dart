import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ViewCategoraisDataSourceRemote {
  Future<void> getDataCategorais();
}

class ViewCategoraisDataSourceRemoteImp extends ViewCategoraisDataSourceRemote {
  @override
  Future<void> getDataCategorais() async {
    await FirebaseFirestore.instance
        .collection('categorias')
        .get()
        .then((QuerySnapshot querySnapshot) {
      List data = querySnapshot.docs;
    });
  }
}
