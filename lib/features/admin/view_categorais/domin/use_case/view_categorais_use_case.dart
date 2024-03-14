import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/admin/view_categorais/data/repos/view_categorais_repo_imp.dart';

class ViewCategoraisUseCase {
  ViewCategoraisRepoImp viewCategoraisRepoImp;
  ViewCategoraisUseCase(this.viewCategoraisRepoImp);
  Future<Either<Failure, List<QueryDocumentSnapshot>>> call() async {
    return await viewCategoraisRepoImp.getCategorais();
  }
}
