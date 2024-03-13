import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/features/admin/categorias/domin/use_case/add_categorais_use_case.dart';

import '../../../../../../core/failure/failure.dart';

part 'categorias_event.dart';
part 'categorias_state.dart';

class CategoriasBloc extends Bloc<CategoriasEvent, CategoriasState> {
  AddCategoraisUseCase addCategoraisUseCase;
  CategoriasBloc(this.addCategoraisUseCase) : super(CategoriasInitial()) {
    on<AddCategorias>(_addCategorais);
  }

  Future<void> _addCategorais(
      AddCategorias event, Emitter<CategoriasState> emit) async {
    emit(CategoriasLoding());
    final Either<Failure, String> result =
        await addCategoraisUseCase.call(name: event.name);
    result.fold((failure) => emit(CategoriasFaliure(masseage: failure.message)),
        (success) => emit(CategoriasSuccess(masseage: success)));
  }
}
