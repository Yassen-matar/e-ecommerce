part of 'categorias_bloc.dart';

sealed class CategoriasState extends Equatable {
  const CategoriasState();

  @override
  List<Object> get props => [];
}

class CategoriasInitial extends CategoriasState {}

class CategoriasSuccess extends CategoriasState {
  final String? masseage;

  const CategoriasSuccess({required this.masseage});
}

class CategoriasFaliure extends CategoriasState { 
    final String? masseage;

  const CategoriasFaliure({required this.masseage});
}

class CategoriasLoding extends CategoriasState {}
