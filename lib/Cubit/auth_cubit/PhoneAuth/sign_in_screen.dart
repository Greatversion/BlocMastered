import 'package:bloc_mastered/Cubit/auth_cubit/PhoneAuth/verify_phone_numer.dart';
import 'package:bloc_mastered/Cubit/auth_cubit/auth_cubit.dart';
import 'package:bloc_mastered/Cubit/auth_cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneScreen extends StatelessWidget {
  const SignInPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("SIgn-In Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Phone Number"),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthCodeSentState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PhoneVerificationScreen()));
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox(
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          String phoneNumber = '+91${_phoneController.text}';
                          BlocProvider.of<AuthCubit>(context)
                              .SendOTP(phoneNumber);
                        },
                        child: const Text("Send OTP")),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
