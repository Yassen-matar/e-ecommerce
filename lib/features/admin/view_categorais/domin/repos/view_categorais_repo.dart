import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';

abstract class ViewCategoraisRepo {
 Future<Either<Failure, List<QueryDocumentSnapshot>> > getCategorais();
}
