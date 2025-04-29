class User {
  final String name;

  User({required this.name});

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      name: data['Username'] ?? '',
    );
  }
}