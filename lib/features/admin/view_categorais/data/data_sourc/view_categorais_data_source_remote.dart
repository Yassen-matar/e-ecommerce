import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ViewCategoraisDataSourceRemote {
  Future getDataCategorais();
}

class ViewCategoraisDataSourceRemoteImp extends ViewCategoraisDataSourceRemote {
  @override
  Future getDataCategorais() async {
    List<QueryDocumentSnapshot>? data = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('categorias').get();

    data.addAll(querySnapshot.docs);
    print(data);
    return data;
  }
}
