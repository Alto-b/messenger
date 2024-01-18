part of 'list_bloc.dart';

sealed class ListState extends Equatable {
  const ListState();
  
  @override
  List<Object> get props => [];
}

final class ListInitial extends ListState {}
