import 'package:bloc_mastered/API_Handling/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_mastered/Bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_mastered/Cubit/auth_cubit/auth_cubit.dart';
import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_bloc.dart';
import 'package:bloc_mastered/Screens/Sign_In/signInScreen.dart';
import 'package:bloc_mastered/Screens/homepage.dart';
import 'package:bloc_mastered/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
         create: (BuildContext context) => SignInBloc()),
        BlocProvider(
          create: (BuildContext context) => InternetBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => AuthCubit(),
        ),
         BlocProvider(
          create: (BuildContext context) => PostCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}
