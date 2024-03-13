part of 'categorias_bloc.dart';

sealed class CategoriasEvent extends Equatable {
  const CategoriasEvent();

  @override
  List<Object> get props => [];
}

class AddCategorias extends CategoriasEvent { 
  final String name;

   const AddCategorias({required this.name});
}
