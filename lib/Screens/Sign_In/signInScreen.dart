import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_bloc.dart';
import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_event.dart';
import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorMessage);
                } else {
                  return const Text("");
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Email"),
              controller: _emailController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailvalue: _emailController.text,
                    passwordvalue: _passwordController.text));
              },
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
              controller: _passwordController,
              onChanged: (val) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailvalue: _emailController.text,
                    passwordvalue: _passwordController.text));
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Sign-in"))
          ],
        ),
      ),
    );
  }
}
