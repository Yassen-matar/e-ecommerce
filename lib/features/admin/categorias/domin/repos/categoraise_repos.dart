import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';

abstract class CategoraisRepo {
  Future<Either<Failure, String>> addCategorais(String name);
  Future<Either<Failure, String>> uploadFile(File path, String imagePath);
}
