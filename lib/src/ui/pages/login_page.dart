import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final List<Map<String, String>> users = [
    {'name': 'Alice', 'image': 'assets/images/zzz_icon.png'},
    {'name': 'Bob', 'image': 'assets/images/zzz_icon.png'},
    {'name': 'Charlie', 'image': 'assets/images/zzz_icon.png'},
    {'name': 'Diana', 'image': 'assets/images/zzz_icon.png'},
  ];

  String? selectedUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qui est-ce ?')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
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
              onTap: () {
                // Lorsqu'on clique, on va directement sur Home
                context.go('/home');
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(user['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
