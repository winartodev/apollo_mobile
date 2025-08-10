/// Base interface for all Use Cases in Clean Architecture.
///
/// [T1] → the return type (output).
/// [T2] → the parameter type required for execution (input).
///
/// Example usage:
/// ```dart
/// class SignInUseCase implements UseCase<AuthEntity, SignInEntity> {
///   final AuthRepository repository;
///
///   SignInUseCase(this.repository);
///
///   @override
///   Future<AuthEntity> execute(SignInEntity params) {
///     return repository.signIn(params);
///   }
/// }
/// ```
///
/// For use cases without parameters, use `NoParams`:
/// ```dart
/// class NoParams {}
///
/// class GetProfileUseCase implements UseCase<AuthEntity, NoParams> {
///   final AuthRepository repository;
///
///   GetProfileUseCase(this.repository);
///
///   @override
///   Future<AuthEntity> execute(NoParams params) {
///     return repository.getProfile();
///   }
/// }
/// ```
abstract class Usecase<T1, T2> {
  /// Executes the use case with the provided [data] of type [T2].
  /// Returns a result of type [T1].
  Future<T1> execute(T2 data);
}
