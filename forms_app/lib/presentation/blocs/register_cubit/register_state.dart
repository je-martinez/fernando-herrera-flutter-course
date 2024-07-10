part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFormState extends Equatable {
  final Username username;
  final Email email;
  final Password password;
  final FormStatus status;
  final bool isValid;

  const RegisterFormState(
      {this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.status = FormStatus.invalid,
      this.isValid = false});

  RegisterFormState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormStatus? status,
    bool? isValid,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [username, email, password, status, isValid];
}
