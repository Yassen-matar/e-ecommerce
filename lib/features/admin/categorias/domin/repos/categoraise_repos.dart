import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';

abstract class CategoraisRepo {
 Future<Either<Failure, String>> addCategorais(String name);
}
