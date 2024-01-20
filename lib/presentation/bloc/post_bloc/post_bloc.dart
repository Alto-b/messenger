import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messenger/controller/fetch_controller.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  FetchApiProvider api;
  PostBloc(this.api) : super(PostInitial()) {
    on<sendEvent>((event, emit) {
      api.postApi(event.user, event.message);
    });
  }
}
