import 'package:bloc_mastered/API_Handling/data/repositories/post_repositories.dart';
import 'package:bloc_mastered/API_Handling/logic/cubits/post_cubit/post_cubit.dart';
import 'package:bloc_mastered/API_Handling/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Handling..."),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostLoadedState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title.toString()),
                    subtitle: Text(state.posts[index].title.toString()),
                  );
                });
          }
          return const Center(
            child: Text("Error aa gya.."),
          );
        }),
      ),
    );
  }
}
