import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_event.dart';
import 'package:bloc_mastered/Screens/Sign_In/bloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (event.emailvalue == "") {
        emit(SignInErrorState(errorMessage: "Enter a valid Email."));
      } else if (event.passwordvalue.length <= 7) {
        emit(SignInErrorState(errorMessage: "Enter a valid Password."));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
