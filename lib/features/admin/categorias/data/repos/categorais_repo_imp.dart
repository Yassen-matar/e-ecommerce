import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/features/admin/categorias/data/data_source/categorias_remote_data_source.dart';
import 'package:untitled/features/admin/categorias/domin/repos/categoraise_repos.dart';

import '../../../../../core/failure/failure.dart';

class CategoraisRepoImp extends CategoraisRepo {
  CategoriasRomteDataSourceImp categoriasRomteDataSourceImp;
  CategoraisRepoImp(this.categoriasRomteDataSourceImp);
  @override
  Future<Either<Failure, String>> addCategorais(String name) async {
    try {
      await categoriasRomteDataSourceImp.addCategorais(name);
      return const Right('Success');
    } on FirebaseException catch (e) { 
            return Left(AnyFailure(e.code));
    } catch (e) { 
            return const Left(AnyFailure());
    }
  }
}  