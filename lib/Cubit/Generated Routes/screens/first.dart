import 'package:bloc_mastered/Cubit/Generated%20Routes/first_cubit.dart';
import 'package:bloc_mastered/Cubit/Generated%20Routes/screens/second.dart';
import 'package:bloc_mastered/Cubit/Generated%20Routes/second_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("First"),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => FirstCubit(),
                                child: const SecondScreen(),
                              )));
                },
                icon: const Icon(Icons.access_alarm_outlined)),
            const SizedBox(height: 25),
            BlocBuilder<FirstCubit, int>(
              builder: (context, state) {
                return const Text("state.toString()");
              },
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            BlocProvider.of<FirstCubit>(context).increment();
          }),
    );
  }
}
