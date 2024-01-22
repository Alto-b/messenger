import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/controller/fetch_controller.dart';
import 'package:messenger/presentation/bloc/fetch_bloc/fetch_bloc.dart';
import 'package:messenger/presentation/bloc/post_bloc/post_bloc.dart';

class HomePage extends StatelessWidget {
   HomePage({
    super.key,
    required this.name});

   String name;

  final textController = TextEditingController();

  // String currentUser = name;

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => PostBloc(FetchApiProvider()),
    
        ),
            BlocProvider(
                create: (context) => FetchBloc(FetchApiProvider())..add(FetchLoadedEvent()),
            ),
        ],
              child: Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.person_2),
              title:  Text("hey $name"),
              actions: [
                IconButton(onPressed: () {
                    
                }, icon: const Icon(Icons.settings))
              ],
            ),
                    
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    BlocBuilder<FetchBloc, FetchState>(
                      builder: (context, state) {
                        
                      print("entered builder");  
                    
                        return Container(
                                                          clipBehavior: Clip.antiAlias,
                                                          height: screenHeight - 180,
                                                          width: screenWidth - 30,
                                                          decoration: BoxDecoration(
                                                              // color: Colors.green,
                                                              border: Border.all(),
                                                              borderRadius: BorderRadius.circular(20)),
                                                            child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: bodyMessage(state, context)
                                                          ),
                                                        );
                      },
                    ),
                    const SizedBox(height: 10),
            
                    // Text input section
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth - 20,
                            child: Stack(
                              children: [
                                TextFormField(
                                                                controller:textController,
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(30))),
                                                              ),
                                Positioned(
                                  bottom: 15,
                                  right: 10,
                                  top: 10,
                                  child: IconButton(
                                      onPressed: () { submit(context);},
                                      icon: const Icon(
                                        Icons.send,
                                        size: 30,
                                        color: Colors.deepPurple,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
                    ),
    );
  }

void submit(BuildContext context) {
  if (textController.text.isNotEmpty) {
    context.read<PostBloc>().add(sendEvent(user: name, message: textController.text));
    context.read<FetchBloc>().add(FetchLoadedEvent());
    textController.clear();
  }
}


Widget bodyMessage(state, context){

  if(state is FetchInitialState){
    print("entered loading");
    return Center(child: CircularProgressIndicator());
  }

   if(state is fetchLoadedState){  
      print("entered loaded ${state.list.length}");
    // if(state.list.length != 0 ){
      return ListView.builder(
                                      itemCount:state.list.length ,
                                      itemBuilder: ((context, index) {
                                        return   Padding(
                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          child: ListTile(
                                            // leading: Icon(Icons.arrow_right),
                                            title: RichText(
                                              text: TextSpan(
                                                text: "${state.list[index].title} : ",
                                                style: DefaultTextStyle.of(context).style.copyWith(fontSize: 17),
                                                children:  <TextSpan>[
                                                  TextSpan(text:"${state.list[index].description}", style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                                                ],
                                              ),
                                            ),
                                            // trailing:  Text("${state.list[index].updatedAt}"),
                                          ),
                                        );
                                      }),
                                    );
    // }
  } 
  if(state is fetchErrorState){
    print("entered error ");
      return Text("failed to fetch the messages");
    }
  return Center(child: Icon(Icons.error));
}
}