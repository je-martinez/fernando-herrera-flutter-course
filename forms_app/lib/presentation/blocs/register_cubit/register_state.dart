part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final String username;
  final String email;
  final String password;
  final FormStatus status;

  const RegisterFormState(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.status = FormStatus.invalid});

  RegisterFormState copyWith({
    String? username,
    String? email,
    String? password,
    FormStatus? status,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [username, email, password, status];
}
