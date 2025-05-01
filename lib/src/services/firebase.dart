import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FireStoreService {

  static final FireStoreService _fireStoreService = FireStoreService.internal();

  factory FireStoreService() {
    return _fireStoreService;
  }
  FireStoreService.internal();



  Future<List<Map<String, dynamic>>> getGames() async {
    try {
      final _db = FirebaseFirestore.instance;
      CollectionReference gamesCollection = _db.collection('Games');

      QuerySnapshot snapshot = await gamesCollection.get();
      List<QueryDocumentSnapshot> documents = snapshot.docs;

      // Convert documents to a list of maps
      return documents.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      rethrow; // Propagate error
    }
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final _db = FirebaseFirestore.instance;
      CollectionReference gamesCollection = _db.collection('Users');

      QuerySnapshot snapshot = await gamesCollection.get();
      List<QueryDocumentSnapshot> documents = snapshot.docs;

      // Convert documents to a list of maps
      return documents.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    } catch (e) {
      rethrow; // Propagate error
    }
  }

  Future<List<dynamic>> getGameReservations(String gameId) async {
    DocumentReference game = FirebaseFirestore.instance.collection("Games").doc(gameId);

    try {
      DocumentSnapshot docSnapshot = await game.get();

      if (docSnapshot.exists) {
        List<dynamic> currentArray = docSnapshot.get('Reservations') ?? [];
        return currentArray;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> setGameReservation(String gameId) async {
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString("userName");

    DocumentReference game = FirebaseFirestore.instance.collection("Games").doc(gameId);

    try {
      DocumentSnapshot docSnapshot = await game.get();

      if (docSnapshot.exists) {
        List<dynamic> currentArray = docSnapshot.get('Reservations') ?? [];

        if (currentArray.contains(user)) {
          throw Exception("User already reserved this game");
        }

        if (currentArray.length < 4) {
          currentArray.add(user);

          await game.update({'Reservations': currentArray});
        } else {
          throw Exception("Game has already 4 reservations");
        }
      } else {
        await game.set({
          'Reservations': [user],
        });
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeGameReservation(String gameId) async {
    DocumentReference game = FirebaseFirestore.instance.collection('Games').doc(gameId);
    final prefs = await SharedPreferences.getInstance();
    final user = prefs.getString("userName");

    try {
      DocumentSnapshot docSnapshot = await game.get();

      if (docSnapshot.exists) {
        List<dynamic> currentArray = docSnapshot.get('Reservations') ?? [];

        if (currentArray.contains(user)) {
          currentArray.remove(user);

          await game.update({'Reservations': currentArray});
        } else {
          throw Exception("Tried to remove a user that isn't in the reservations");
        }
      } else {
        throw Exception("Tried to remove a reservation in a document that doesn't exist");
      }
    } catch (e) {
      rethrow;
    }
  }

}