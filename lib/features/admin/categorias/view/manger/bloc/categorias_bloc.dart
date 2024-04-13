import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/features/admin/categorias/domin/use_case/add_categorais_use_case.dart';
import 'package:untitled/features/admin/categorias/domin/use_case/upload_file_use_case.dart';
import '../../../../../../core/failure/failure.dart';
part 'categorias_event.dart';
part 'categorias_state.dart';

class CategoriasBloc extends Bloc<CategoriasEvent, CategoriasState> {
  AddCategoraisUseCase addCategoraisUseCase;
  UploadFileUseCase uploaFileUseCase;
  CategoriasBloc(this.addCategoraisUseCase, this.uploaFileUseCase)
      : super(CategoriasInitial()) {
    on<AddCategorias>(_addCategorais);
    on<UploadFileEvent>(_uploadFile);
  }

  Future<void> _addCategorais(
      AddCategorias event, Emitter<CategoriasState> emit) async {
    emit(CategoriasLoding());
    final Either<Failure, String> result =
        await addCategoraisUseCase.call(name: event.name);
    result.fold((failure) => emit(CategoriasFaliure(masseage: failure.message)),
        (success) => emit(CategoriasSuccess(masseage: success)));
  }

  Future<void> _uploadFile(
      UploadFileEvent event, Emitter<CategoriasState> emit) async {
    ImagePicker imagePicker = ImagePicker();
    final XFile? imageGalery =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (imageGalery != null) {
      File file = File(imageGalery.path);

      emit(CategoriasLoding());
      final Either<Failure, String> result =
          await uploaFileUseCase.call(path: file, imagePath: imageGalery.path);
      result.fold(
          (failure) => emit(CategoriasFaliure(masseage: failure.message)),
          (success) => emit(CategoraisUploadImageSuccess(masseage: success)));
    } else {
      emit(const CategoriasFaliure(masseage: "No Data Found"));
    }
  }
}
