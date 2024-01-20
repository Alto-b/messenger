import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:messenger/controller/fetch_controller.dart';
import 'package:messenger/models/messenger_model.dart';

part 'fetch_event.dart';
part 'fetch_state.dart';

class FetchBloc extends Bloc<FetchEvent, FetchState> {
  FetchApiProvider messenger ;
  FetchBloc(this.messenger) : super(FetchInitialState()) {

    on<FetchLoadedEvent>((event, emit)async {
      emit(FetchInitialState());
      try{
        final messageData = await messenger.fetchApi();
        print("messageData : ${messageData.length}");
        emit(fetchLoadedState(list: messageData));
        print("list loaded in bloc ");
      }
      catch(e){
        emit(fetchErrorState(error: e.toString()));
      }
    });

  }
}
