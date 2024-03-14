import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/admin/view_categorais/data/data_sourc/view_categorais_data_source_remote.dart';

import '../../domin/repos/view_categorais_repo.dart';

class ViewCategoraisRepoImp extends ViewCategoraisRepo {
  ViewCategoraisDataSourceRemoteImp viewCategoraisDataSourceRemoteImp;
  ViewCategoraisRepoImp(this.viewCategoraisDataSourceRemoteImp);
  @override
  Future<Either<Failure, List<QueryDocumentSnapshot>>> getCategorais() async {
    try {
      List<QueryDocumentSnapshot> data =
          await viewCategoraisDataSourceRemoteImp.getDataCategorais();
      return Right(data);
    } on FirebaseException catch (e) {
      return Left(AnyFailure(e.code));
    } catch (e) {
      return const Left(AnyFailure());
    }
  }
}
