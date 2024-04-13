import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:untitled/core/failure/failure.dart';
import 'package:untitled/features/admin/categorias/domin/repos/categoraise_repos.dart';

class UploadFileUseCase {
  final CategoraisRepo signInRepo;
  UploadFileUseCase(this.signInRepo);

  Future<Either<Failure, String>> call(
      {required File path, required String imagePath}) async {
    return await signInRepo.uploadFile(path, imagePath);
  }
}
