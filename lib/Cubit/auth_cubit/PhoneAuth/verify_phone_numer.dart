import 'package:bloc_mastered/Cubit/auth_cubit/auth_cubit.dart';
import 'package:bloc_mastered/Cubit/auth_cubit/auth_states.dart';
import 'package:bloc_mastered/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneVerificationScreen extends StatelessWidget {
  const PhoneVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify the OTP"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _otpController,
              maxLength: 6,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "6 digits OTP"),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoadingState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return (state is AuthLoadingState)
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                        
                          BlocProvider.of<AuthCubit>(context).VerifyOTP(_otpController.text);
                        },
                        child: const Text("Verify OTP"));
              },
            )
          ],
        ),
      ),
    );
  }
}
