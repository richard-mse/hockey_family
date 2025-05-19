import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
  Future<String> fetchDogImage() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['message'];
    } else {
      throw Exception('Failed to load dog image');
    }
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
                          child: FutureBuilder<String>(
                            future: fetchDogImage(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Center(child: Icon(Icons.error));
                              } else {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }
                            },
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
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
