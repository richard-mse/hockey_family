import 'package:cloud_firestore/cloud_firestore.dart';

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
}