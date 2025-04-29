import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/user_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserRepository repository;

  LoginCubit(this.repository) : super(LoginInitial());

  Future<void> loadUsers() async {
    emit(LoginLoading());
    try {
      final users = await repository.fetchUsers();
      emit(LoginLoaded(users));
    } catch (_) {
      emit(LoginError('Impossible de charger les utilisateurs'));
    }
  }
}

