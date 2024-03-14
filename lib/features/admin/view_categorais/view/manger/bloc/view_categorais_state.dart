// ignore_for_file: must_be_immutable

part of 'view_categorais_bloc.dart';

sealed class ViewCategoraisState {
  const ViewCategoraisState();
}

class ViewCategoraisInitial extends ViewCategoraisState {}

class ViewCategoraisSuccuss extends ViewCategoraisState {
   // ignore: prefer_typing_uninitialized_variables
   var categorais;

  ViewCategoraisSuccuss( this.categorais);
}

class ViewCategoraisLoding extends ViewCategoraisState {}

class ViewCategoraisFailure extends ViewCategoraisState {
  final String message;

  const ViewCategoraisFailure(this.message);
}
