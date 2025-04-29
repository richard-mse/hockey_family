import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/models/user_model.dart';
import 'login_cubit.dart';
import 'login_state.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    context.read<LoginCubit>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qui est-ce ?')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoginError) {
              return Center(child: Text(state.message));
            } else if (state is LoginLoaded) {
              final List<User> users = state.users;

              return GridView.builder(
                itemCount: users.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder: (context, index) {
                  final user = users[index];

                  return GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('userName', user.name);
                      context.go('/home');
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/zzz_icon.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink(); // pour l’état initial
          },
        ),
      ),
    );
  }
}