import 'dart:async';

import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences sharedPreferences;
  final SignInUsecase signInUsecase;
  final SignUpUsecase signUpUsecase;

  AuthBloc({
    required this.signInUsecase,
    required this.sharedPreferences,
    required this.signUpUsecase,
  }) : super(AuthInitial()) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignInLoading());

    try {
      final result = await signInUsecase.execute(
        SignInEntity(username: event.username, password: event.password),
      );
      emit(SignInSuccess(result));
    } catch (e) {
      final errorMessage = e.toString();
      emit(SignInFailure(errorMessage));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());

    try {
      final result = await signUpUsecase.execute(
        SignUpEntity(
          username: event.username,
          password: event.password,
          email: event.email,
          phoneNumber: event.phoneNumber,
        ),
      );

      emit(SignUpSuccess(result));
    } catch (e) {
      final errorMessage = e.toString();
      emit(SignUpFailure(errorMessage));
    }
  }
}
