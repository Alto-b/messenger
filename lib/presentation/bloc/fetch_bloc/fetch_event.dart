part of 'fetch_bloc.dart';

sealed class FetchEvent extends Equatable {
  const FetchEvent();

}

class FetchLoadedEvent extends FetchEvent{

  @override
  List<Object> get props => [];


}
