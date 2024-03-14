part of 'view_categorais_bloc.dart';

sealed class ViewCategoraisEvent  {
  const ViewCategoraisEvent();

}

class GetCategorais extends ViewCategoraisEvent {}
