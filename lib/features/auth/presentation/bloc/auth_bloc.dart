import 'dart:async';

import 'package:apollo_mobile/features/auth/domain/usecases/auth_storage_usecase.dart';
import 'package:apollo_mobile/features/auth/presentation/models/auth_response_model.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_in_entity.dart';
import 'package:apollo_mobile/features/auth/domain/entities/sign_up_entity.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:apollo_mobile/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'sign_in_state.dart';
part 'sign_up_state.dart';
part 'otp_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences sharedPreferences;
  final SignInUseCase signInUsecase;
  final SignUpUseCase signUpUsecase;
  final AuthStorageUsecase authStorageUsecase;

  AuthBloc({
    required this.signInUsecase,
    required this.sharedPreferences,
    required this.signUpUsecase,
    required this.authStorageUsecase,
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
      final signInEntity = SignInEntity(
        username: event.username,
        password: event.password,
      );

      final resp = await signInUsecase.execute(signInEntity);

      emit(SignInSuccess(AuthResponseModel.fromEntity(resp)));
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
      final signUpEntity = SignUpEntity(
        username: event.username,
        password: event.password,
        email: event.email,
        phoneNumber: event.phoneNumber,
      );

      final resp = await signUpUsecase.execute(signUpEntity);

      emit(SignUpSuccess(AuthResponseModel.fromEntity(resp)));
    } catch (e) {
      final errorMessage = e.toString();
      emit(SignUpFailure(errorMessage));
    }
  }
}
