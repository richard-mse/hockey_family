
import '../services/firebase.dart';
import 'models/user_model.dart';

class UserRepository {
  final FireStoreService _api = FireStoreService();

  Future<List<User>> fetchUsers() async {
    try {
      final userMaps = await _api.getUsers();
      return userMaps.map((map) => User.fromMap(map)).toList();
    } catch (e) {
      throw Exception('Erreur lors du chargement des utilisateurs : $e');
    }
  }
}