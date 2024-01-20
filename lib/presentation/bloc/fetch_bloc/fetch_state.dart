part of 'fetch_bloc.dart';

abstract class FetchState extends Equatable {

}

 class FetchInitialState extends FetchState {
  @override 
  List<Object> get props => [];
}


 class fetchLoadedState extends FetchState{
  final List<MessengerModel> list;

  fetchLoadedState({required this.list});

  @override 
  List<Object> get props => [];
}

class fetchErrorState extends FetchState{
  final String? error;
  
  fetchErrorState({required this.error});

  @override
  List<Object> get props => [];

}