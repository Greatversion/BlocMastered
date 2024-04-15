import 'package:bloc_mastered/API_Handling/Presentation/Screens/home_screen.dart';
import 'package:bloc_mastered/Bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_mastered/Bloc/internet_bloc/internet_state.dart';
import 'package:bloc_mastered/Cubit/Generated%20Routes/screens/first.dart';
import 'package:bloc_mastered/Cubit/auth_cubit/PhoneAuth/sign_in_screen.dart';
import 'package:bloc_mastered/Screens/Sign_In/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Homepage"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInScreen();
                  }));
                },
                child: const Text("Form Validation..")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignInPhoneScreen();
                  }));
                },
                child: const Text("Phone Authentication")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
                child: const Text("API Handling")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const FirstScreen();
                  }));
                },
                child: const Text("GoRouting")),
            Center(
              child: BlocConsumer<InternetBloc, InternetState>(
                listener: (context, state) {
                  if (state is InternetGainedState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Gained.."),
                      backgroundColor: Colors.green,
                    ));
                  } else if (state is InternetLostState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Lost.."),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Unavailable"),
                      backgroundColor: Colors.grey,
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is InternetGainedState) {
                    return const Text("Gained..");
                  } else if (state is InternetLostState) {
                    return const Text("Lost..");
                  } else {
                    return const Text("Unavailable");
                  }
                },
              ),
            ),
          ],
        ));
  }
}

//  if (state is InternetGainedState) {
//               return const Text("Gained..");
//             } else if (state is InternetLostState) {
//               return const Text("Losted");
//             } else {
//               return const Text("Unavailable");
//             }