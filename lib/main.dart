import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messenger/controller/fetch_controller.dart';
import 'package:messenger/presentation/UI/homepage.dart';
import 'package:messenger/presentation/UI/loading.dart';
import 'package:messenger/presentation/bloc/fetch_bloc/fetch_bloc.dart';
import 'package:messenger/presentation/bloc/post_bloc/post_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
           BlocProvider(
          create: (context) => FetchBloc(RepositoryProvider.of<FetchApiProvider>(context))..add(FetchLoadedEvent()),
        ),
           BlocProvider(
          create: (context) => PostBloc(FetchApiProvider()), 
        ),
        ],
              child: MaterialApp(
                    title: 'messenger',
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
                    ),
                    home: LoadingPage(),
                  ),
    );
  }
}
