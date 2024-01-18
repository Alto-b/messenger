import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/presentation/bloc/fetch_bloc/fetch_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    
    return Scaffold(
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
              Container(
                clipBehavior: Clip.antiAlias,
                height: screenHeight - 180,
                width: screenWidth - 30,
                decoration: BoxDecoration(
                    // color: Colors.green,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: ((context, index) {
                      return   Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,0),
                        child: ListTile(
                          // leading: Icon(Icons.arrow_right),
                          title: RichText(
                            text: TextSpan(
                              text: "$name : ",
                              style: DefaultTextStyle.of(context).style.copyWith(fontSize: 17),
                              children: const <TextSpan>[
                                TextSpan(text: 'hey there', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                              ],
                            ),
                          )
                          // subtitle: const Text("sadsadsad"),
                        ),
                      );
                    }),
                  ),
                ),
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
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          Positioned(
                            bottom: 15,
                            right: 10,
                            top: 10,
                            child: IconButton(
                                onPressed: () {},
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
    );
  }

}