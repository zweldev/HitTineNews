part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    required this.isRegister,
    this.user,
  });

  final bool isRegister;
  final User? user;

  AuthState copyWith({
    bool? isRegister,
    User? user
  }) {
    return AuthState(isRegister: isRegister ?? this.isRegister, user: user ?? this.user);
  }

  @override
  List get props => [user, isRegister];
}
