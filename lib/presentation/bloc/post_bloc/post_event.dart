part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class sendEvent extends PostEvent{
  String user;
  String message;
  sendEvent({required this.user,required this.message});

  @override
  List<Object> get props => [user,message];
}
