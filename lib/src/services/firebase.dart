import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  static final FirestoreService _firestoreService = FirestoreService.internal();

  factory FirestoreService() {
    return _firestoreService;
  }
  FirestoreService.internal();



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
}