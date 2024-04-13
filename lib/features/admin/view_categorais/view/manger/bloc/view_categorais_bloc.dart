import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/features/admin/view_categorais/domin/use_case/view_categorais_use_case.dart';

import '../../../../../../core/failure/failure.dart';

part 'view_categorais_event.dart';
part 'view_categorais_state.dart';

class ViewCategoraisBloc
    extends Bloc<ViewCategoraisEvent, ViewCategoraisState> {
  ViewCategoraisUseCase viewCategoraisUseCase;
  ViewCategoraisBloc(this.viewCategoraisUseCase)
      : super(ViewCategoraisInitial()) {
    on<GetCategorais>(_getCategorais);
  }

  Future _getCategorais(
      GetCategorais event, Emitter<ViewCategoraisState> emit) async {
    emit(ViewCategoraisLoding());
    final Either<Failure, List<QueryDocumentSnapshot>> result =
        await viewCategoraisUseCase.call();

    result.fold((failure) => emit(ViewCategoraisFailure(failure.message)),
        (data) => emit(ViewCategoraisSuccuss(data)));
  }
}
