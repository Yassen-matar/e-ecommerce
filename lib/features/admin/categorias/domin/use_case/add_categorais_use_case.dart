import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/admin/categorias/domin/repos/categoraise_repos.dart';


class AddCategoraisUseCase {
  final CategoraisRepo signInRepo;
  AddCategoraisUseCase(this.signInRepo); 
  
   Future<Either<Failure, String>> call(
      {required String name, }) async {
    return await signInRepo.addCategorais(name);
  }
}
